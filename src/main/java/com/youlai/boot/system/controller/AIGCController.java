package com.youlai.boot.system.controller;

import com.youlai.boot.common.result.Result;
import com.youlai.boot.core.security.util.SecurityUtils;
import com.youlai.boot.system.model.entity.AIGCRequest;
import com.youlai.boot.system.service.AIGCDetectionService;
import com.youlai.boot.system.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/detect")
public class AIGCController {

    @Autowired
    private UserService userService;

    @Autowired
    private AIGCDetectionService detectionService;


    /**
     * 处理上传的文件并进行AIGC检测
     *
     * @param file 上传的文件
     * @return AIGC检测结果
     */
    @PostMapping("/upload")
    public Map<String, Object> handleUploadAndAIGCDetect(@RequestParam("file") MultipartFile file) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 读取文件内容为字符串
            String content = new String(file.getBytes(), StandardCharsets.UTF_8);
            System.out.println(content);
            //文章字数大小
            System.out.println(content.length());
            // 调用AIGC检测服务进行检测
            Map<String, Object> detectionResult = detectionService.detectAIGC(content);

            response.put("success", true);
            response.put("data", detectionResult);
        } catch (Exception e) {
            // 捕获异常并返回错误信息
            response.put("success", false);
            response.put("message", "AIGC检测过程中出现错误: " + e.getMessage());
        }
        return response;
    }

    @Operation(summary = "查询余额")
    @GetMapping("/balance")
    public Result<BigDecimal> getBalance() {
        Long userId = SecurityUtils.getUserId(); // 获取当前用户ID
        // 查询余额
        BigDecimal balance = userService.getBalance(userId);
        System.out.println(balance);
        return Result.success(balance); // 返回余额
    }
}
