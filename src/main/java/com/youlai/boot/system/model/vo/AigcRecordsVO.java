package com.youlai.boot.system.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 订单视图对象
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Getter
@Setter
@Schema( description = "订单视图对象")
public class AigcRecordsVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键，自增ID")
    private Integer id;
    @Schema(description = "订单号")
    private String orderId;
    @Schema(description = "支付状态（0：未支付，1：已支付）")
    private Integer paymentStatus;
    @Schema(description = "支付金额")
    private BigDecimal paymentAmount;
    @Schema(description = "用户ID")
    private Integer userId;
    @Schema(description = "订单创建时间")
    private LocalDateTime createdTIme;
    @Schema(description = "订单最后修改时间")
    private LocalDateTime updatedTIme;
}
