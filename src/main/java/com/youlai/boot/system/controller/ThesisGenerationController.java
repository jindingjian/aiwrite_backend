package com.youlai.boot.system.controller;

import com.youlai.boot.system.service.ThesisGenerationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/thesis")
public class ThesisGenerationController {

    @Autowired
    private ThesisGenerationService thesisService;

    @PostMapping("/generate-thesis")
    public ResponseEntity<String> generateThesis(@RequestBody Map<String, Object> requestBody) {
        try {
            // 调用 service 生成论文
            String thesisContent = thesisService.generateThesis(requestBody);
            return ResponseEntity.ok(thesisContent);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("生成论文失败: " + e.getMessage());
        }
    }
}
