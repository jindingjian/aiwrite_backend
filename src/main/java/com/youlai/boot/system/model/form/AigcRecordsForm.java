package com.youlai.boot.system.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;

/**
 * 订单表单对象
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Getter
@Setter
@Schema(description = "订单表单对象")
public class AigcRecordsForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键，自增ID")
    private Integer id;

    @Schema(description = "订单号")
    @Size(max=32, message="订单号长度不能超过32个字符")
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
