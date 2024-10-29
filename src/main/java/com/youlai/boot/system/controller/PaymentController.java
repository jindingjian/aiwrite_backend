package com.youlai.boot.system.controller;

import com.alipay.api.AlipayApiException;
import com.youlai.boot.system.model.entity.PaymentRequest;
import com.youlai.boot.system.service.AlipayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/alipay")
public class PaymentController {

    private final AlipayService alipayService;

    public PaymentController(AlipayService alipayService) {
        this.alipayService = alipayService;
    }

    @PostMapping("/createPayment")
    public ResponseEntity<?> createPayment(@RequestBody Map<String, String> requestBody) {
        String amount = requestBody.get("amount");
        try {
            String qrCode = alipayService.createPayment(amount); // 只传递金额
            return ResponseEntity.ok(qrCode); // 返回二维码 URL
        } catch (AlipayApiException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("支付宝接口调用失败: " + e.getMessage());
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

}



