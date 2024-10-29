package com.youlai.boot.system.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class AlipayNotifyController {

    @PostMapping("/alipay/notify")
    public String alipayNotify(HttpServletRequest request) {
        // 获取支付宝发送的通知参数
        String tradeStatus = request.getParameter("trade_status");
        String outTradeNo = request.getParameter("out_trade_no");
        // 这里可以使用支付宝 SDK 提供的验证方法来验证签名和通知的有效性

        // 处理支付结果
        if ("TRADE_SUCCESS".equals(tradeStatus)) {
            // 更新订单状态为已支付
            // ...
            return "success"; // 告诉支付宝处理成功
        }
        return "fail"; // 告诉支付宝处理失败
    }
}
