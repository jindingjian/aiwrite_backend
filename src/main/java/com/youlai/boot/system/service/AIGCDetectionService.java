package com.youlai.boot.system.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class AIGCDetectionService {

    @Value("${aigc.api.url}")
    private String aigcApiUrl;

    @Value("${aigc.api.key}")
    private String apiKey;

    private final ObjectMapper objectMapper = new ObjectMapper();
    private final RestTemplate restTemplate = new RestTemplate();

    public Map<String, Object> detectAIGC(String content) throws Exception {
        // 构建简洁的提示，要求API返回检测报告的具体结构
        String prompt = String.format(
                "请分析上传文档的文章内容是否为AI生成，并按照以下格式返回检测报告：\n标题: <标题>\n作者: <作者>\n字符数: <字符数>\n检测时间: <检测时间>\n" +
                        "AIGC占比:\n- 总占比: <总占比百分比>\n- 高度疑似AIGC: <高度疑似百分比>\n- 中度疑似AIGC: <中度疑似百分比>\n- 轻度疑似AIGC: <轻度疑似百分比>\n" +
                        "内容如下：%s",
                content
        );

        // 构建请求体
        ObjectNode request = objectMapper.createObjectNode();
        request.put("model", "gpt-4o-mini");

        ArrayNode messagesArray = request.putArray("messages");
        messagesArray.addObject().put("role", "user").put("content", prompt);

        request.put("max_tokens", 2000);

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + apiKey);
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<ObjectNode> entity = new HttpEntity<>(request, headers);

        try {
            // 发送请求并获取响应
            ResponseEntity<ObjectNode> response = restTemplate.exchange(aigcApiUrl, HttpMethod.POST, entity, ObjectNode.class);

            // 获取API的响应内容
            ObjectNode responseBody = response.getBody();
            if (responseBody != null) {
                String analysisContent = responseBody.get("choices").get(0).get("message").get("content").asText();

                // 提取并返回结构化检测报告
                return parseDetectionReport(analysisContent);
            } else {
                throw new Exception("API 返回内容为空");
            }
        } catch (HttpClientErrorException | ResourceAccessException e) {
            throw new Exception("API 调用失败: " + e.getMessage());
        }
    }

    // 解析检测报告
    private Map<String, Object> parseDetectionReport(String analysisContent) {
        Map<String, Object> report = new HashMap<>();

        // 使用正则表达式提取关键字段
        report.put("title", extractText("标题: (.+)", analysisContent));
        report.put("author", extractText("作者: (.+)", analysisContent));
        report.put("characterCount", extractNumber("字符数: (\\d+)", analysisContent));
        report.put("detectionTime", extractText("检测时间: (.+)", analysisContent));

        report.put("totalAIGCRatio", extractPercentage("总占比: (\\d+\\.?\\d*)%", analysisContent));
        report.put("highAIGCSuspectRatio", extractPercentage("高度疑似AIGC: (\\d+\\.?\\d*)%", analysisContent));
        report.put("mediumAIGCSuspectRatio", extractPercentage("中度疑似AIGC: (\\d+\\.?\\d*)%", analysisContent));
        report.put("lowAIGCSuspectRatio", extractPercentage("轻度疑似AIGC: (\\d+\\.?\\d*)%", analysisContent));

        report.put("analysis", analysisContent);
        report.put("success", true);

        return report;
    }

    // 提取数值的方法
    private Integer extractNumber(String pattern, String content) {
        Matcher matcher = Pattern.compile(pattern).matcher(content);
        return matcher.find() ? Integer.parseInt(matcher.group(1)) : null;
    }

    // 提取百分比并返回带百分号的字符串
    private String extractPercentage(String pattern, String content) {
        Matcher matcher = Pattern.compile(pattern).matcher(content);
        return matcher.find() ? matcher.group(1) + "%" : null;
    }

    // 提取文本的方法
    private String extractText(String pattern, String content) {
        Matcher matcher = Pattern.compile(pattern).matcher(content);
        return matcher.find() ? matcher.group(1) : null;
    }
}
