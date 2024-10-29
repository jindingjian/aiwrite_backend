package com.youlai.boot.system.service;

import com.alipay.api.AlipayApiException;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePrecreateRequest;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class AlipayService {

    @Value("${alipay.appId}")
    private String appId;

    @Value("${alipay.privateKey}")
    private String privateKey;

    @Value("${alipay.publicKey}")
    private String publicKey;

    @Value("${alipay.gateway}")
    private String gateway;

    public String createPayment(String amount) throws AlipayApiException {
        DefaultAlipayClient client = new DefaultAlipayClient(gateway, appId, privateKey, "json", "UTF-8", publicKey, "RSA2");

        AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();
        request.setNotifyUrl("http://192.168.31.107:9000/AlipayDemo/return_url.jsp"); // 支付回调地址

        // 生成唯一的订单号
        String outTradeNo = "ORD" + System.currentTimeMillis(); // 使用当前时间戳生成唯一订单号

        // 使用 String.format 构造 BizContent
        String bizContent = String.format(
                "{\"out_trade_no\":\"%s\",\"total_amount\":\"%s\",\"subject\":\"充值\",\"alipay_sdk\":\"alipay-sdk-java-4.10.170.ALL\"}",
                outTradeNo, amount
        );
        request.setBizContent(bizContent);

        AlipayTradePrecreateResponse response = client.execute(request);
        System.out.println("支付宝返回的响应: " + response.getBody());

        if (response.isSuccess()) {
            return response.getQrCode(); // 返回生成的二维码
        } else {
            throw new RuntimeException("支付宝下单失败: " + response.getMsg() + ", code: " + response.getCode());
        }
    }
}
