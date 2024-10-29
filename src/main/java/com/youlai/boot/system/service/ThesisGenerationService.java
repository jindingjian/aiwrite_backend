package com.youlai.boot.system.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;

import java.util.*;

@Service
public class ThesisGenerationService {

    @Value("${aigc.api.url}") // 从配置文件中获取AI API的URL
    private String aiApiUrl;

    @Value("${aigc.api.key}") // 从配置文件中获取API密钥
    private String apiKey;

    private final RestTemplate restTemplate; // 用于发起HTTP请求
    private final ObjectMapper objectMapper; // 用于JSON转换

    public ThesisGenerationService(RestTemplate restTemplate, ObjectMapper objectMapper) {
        this.restTemplate = restTemplate;
        this.objectMapper = objectMapper;
    }

    public String generateThesis(Map<String, Object> requestBody) {
        // 从请求体中获取标题、专业、字数和参考文献数量
        String title = (String) requestBody.getOrDefault("title", "未指定标题");
        String major = (String) requestBody.getOrDefault("major", "未指定专业");
        Integer wordCount = (Integer) requestBody.getOrDefault("wordCount", 15000);
        Integer referencesCount = (Integer) requestBody.getOrDefault("referencesCount", 15);

        // 生成论文大纲
        List<String> outline = generateOutline(title);

        // 根据大纲生成论文内容
        return generateThesisContent(title, major, wordCount, outline, referencesCount);
    }

    private List<String> generateOutline(String title) {
        // 生成大纲的提示词
        String prompt = String.format(
                "请根据题目“%s”生成论文大纲，包括摘要、关键字、引言、相关工作、研究方法、实验与结果、讨论和结论，每一部分用换行分隔。",
                title
        );
        try {
            return fetchOutlineFromAI(prompt);
        } catch (Exception e) {
            return Collections.emptyList(); // 返回空列表而不是错误信息
        }
    }

    private List<String> fetchOutlineFromAI(String prompt) throws Exception {
        // 构建请求对象
        ObjectNode request = objectMapper.createObjectNode();
        request.put("model", "gpt-4o");

        ArrayNode messagesArray = request.putArray("messages");
        messagesArray.addObject().put("role", "user").put("content", prompt);

        request.put("max_tokens", 500); // 根据预期大纲长度调整
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + apiKey);
        headers.set("Content-Type", "application/json");

        HttpEntity<ObjectNode> entity = new HttpEntity<>(request, headers);
        try {
            ResponseEntity<ObjectNode> response = restTemplate.exchange(aiApiUrl, HttpMethod.POST, entity, ObjectNode.class);
            String outlineContent = Objects.requireNonNull(response.getBody()).get("choices").get(0).get("message").get("content").asText();
            return List.of(outlineContent.split("\n")); // 假设大纲以换行分隔
        } catch (HttpClientErrorException | ResourceAccessException e) {
            throw new Exception("API 调用失败: " + e.getMessage());
        }
    }

    private String generateThesisContent(String title, String major, int totalWordCount, List<String> outline, int referencesCount) {
        // 分配各部分的字数
        int[] wordCounts = distributeWordCounts(totalWordCount);

        // 生成参考文献
        List<String> references = generateReferences(referencesCount, title);

        // 生成完整的论文内容
        return generateFormattedTitle(title) +
                generateAbstract(title, major, wordCounts[0]) +
                generateSectionsFromOutline(outline, wordCounts) +
                formatReferences(references);
    }

    private String generateSectionsFromOutline(List<String> outline, int[] wordCounts) {
        StringBuilder sections = new StringBuilder();
        String[] sectionNames = {"引言", "相关工作", "研究方法", "实验与结果", "讨论", "结论"};

        // 遍历各个章节名称，根据大纲生成对应的内容
        for (int i = 0; i < sectionNames.length; i++) {
            String sectionTitle = sectionNames[i]; // 直接使用章节名称

            // 安全获取大纲中的内容，若未提供则使用默认内容
            String sectionOverview = (i < outline.size()) ? outline.get(i) : "该章节内容尚未提供。";

            // 获取该章节的字数
            int wordCount = wordCounts[i + 1];

            // 生成章节内容并附加到sections中
            sections.append(generateSection(sectionTitle, wordCount, sectionOverview));
        }
        return sections.toString();
    }

    private List<String> generateReferences(int count, String title) {
        List<String> references = new ArrayList<>();
        // 使用提示词生成参考文献
        String prompt = String.format("请为论文标题“%s”生成%d条真实的中文参考文献。", title, count);
        try {
            String referenceContent = fetchContentFromAI(prompt, 100); // 获取生成的参考文献内容
            String[] refArray = referenceContent.split("\n"); // 假设返回的参考文献以换行分隔
            // 将每一条参考文献添加到列表中
            references.addAll(Arrays.asList(refArray));
        } catch (Exception e) {
            // 返回空列表而不是错误信息
        }
        return references;
    }

    private String formatReferences(List<String> references) {
        StringBuilder referencesContent = new StringBuilder("<h3>参考文献</h3><ol>");
        for (String ref : references) {
            referencesContent.append(String.format("<li>%s</li>", ref.trim())); // 去掉多余的空格
        }
        referencesContent.append("</ol>");
        return referencesContent.toString();
    }

    private int[] distributeWordCounts(int totalWordCount) {
        // 根据总字数分配各部分的字数
        return new int[]{
                (int) (totalWordCount * 0.02), // 摘要
                (int) (totalWordCount * 0.15), // 引言
                (int) (totalWordCount * 0.15), // 相关工作
                (int) (totalWordCount * 0.20), // 研究方法
                (int) (totalWordCount * 0.20), // 实验与结果
                (int) (totalWordCount * 0.15), // 讨论
                (int) (totalWordCount * 0.13)  // 结论
        };
    }

    private String generateFormattedTitle(String title) {
        // 格式化标题
        return String.format("<h2>%s</h2>", title);
    }

    private String generateAbstract(String title, String major, int abstractWordCount) {
        // 生成摘要和关键词
        return "<h3>摘要</h3>" +
                generateSectionContent("摘要", abstractWordCount, "请根据以下内容生成摘要。") +
                "<h3>关键词</h3>" +
                generateKeywords(title);
    }

    private String generateKeywords(String title) {
        // 根据标题生成关键词
        String keywords = title.replace(" ", "；");
        return String.format("<p>%s</p>", keywords);
    }

    private String generateSection(String sectionTitle, int wordCount, String sectionOutline) {
        // 生成章节内容
        return String.format("<h3>%s</h3><p>%s</p>",
                sectionTitle, generateSectionContent(sectionTitle, wordCount, sectionOutline));
    }

    private String generateSectionContent(String sectionTitle, int wordCount, String sectionOutline) {
        // 使用提示词将章节大纲扩展到指定字数
        String prompt = String.format("根据以下大纲内容生成“%s”的内容，字数约为%d字:\n%s",
                sectionTitle, wordCount, sectionOutline);
        try {
            return fetchContentFromAI(prompt, wordCount);
        } catch (Exception e) {
            return ""; // 返回空字符串而不是错误信息
        }
    }

    private String fetchContentFromAI(String prompt, int wordCount) throws Exception {
        // 发送请求到AI获取内容
        ObjectNode request = objectMapper.createObjectNode();
        request.put("model", "gpt-4o");

        ArrayNode messagesArray = request.putArray("messages");
        messagesArray.addObject().put("role", "user").put("content", prompt);

        request.put("max_tokens", wordCount); // 根据请求的字数设置最大token数
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + apiKey);
        headers.set("Content-Type", "application/json");

        HttpEntity<ObjectNode> entity = new HttpEntity<>(request, headers);
        try {
            ResponseEntity<ObjectNode> response = restTemplate.exchange(aiApiUrl, HttpMethod.POST, entity, ObjectNode.class);
            return Objects.requireNonNull(response.getBody()).get("choices").get(0).get("message").get("content").asText();
        } catch (HttpClientErrorException | ResourceAccessException e) {
            throw new Exception("API 调用失败: " + e.getMessage());
        }
    }
}
