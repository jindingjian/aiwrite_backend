package com.youlai.boot.system.model.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("usr_aigcorders") // 映射数据库表
public class Aigc {

    @TableId
    private String orderId;  // 订单ID

    private String userId;  // 用户ID
    private BigDecimal paymentAmount;  // 支付金额
    private Integer paymentStatus;  // 支付状态，0: 未支付, 1: 已支付
    private Integer totalWordCount;  // 总字数
    private Integer aiGeneratedWordCount;  // AI生成字数
    private String aiPercentage;  // AI生成比例
    private String humanPercentage;  // 人工写作比例
    private Integer humanWrittenWordCount;  // 人类写作字数
    private String analysis;  // 分析结果
    private String message;  // 消息

    private LocalDateTime createTime;  // 创建时间
    private LocalDateTime updateTime;  // 修改时间
}
