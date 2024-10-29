package com.youlai.boot.system.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.youlai.boot.common.base.BaseEntity;

/**
 * 订单实体对象
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Getter
@Setter
@TableName("tb_aigc_records")
public class AigcRecords extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 订单号
     */
    private String orderId;
    /**
     * 支付状态（0：未支付，1：已支付）
     */
    private Integer paymentStatus;
    /**
     * 支付金额
     */
    private BigDecimal paymentAmount;
    /**
     * 用户ID
     */
    private Integer userId;
    /**
     * 订单创建时间
     */
    private LocalDateTime createdTIme;
    /**
     * 订单最后修改时间
     */
    private LocalDateTime updatedTIme;
}
