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
 * AIGC订单表单对象
 *
 * @author tshy
 * @since 2024-10-21 07:23
 */
@Getter
@Setter
@Schema(description = "AIGC订单表单对象")
public class AigcForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "订单标题")
    @Size(max=255, message="订单标题长度不能超过255个字符")
    private String title;

    @Schema(description = "支付状态：0-未支付，1-已支付，2-退款")
    private Integer paymentStatus;

    @Schema(description = "支付时间")
    private LocalDateTime paymentTime;

    @Schema(description = "支付金额")
    private BigDecimal paymentAmount;

    @Schema(description = "作者姓名")
    @Size(max=100, message="作者姓名长度不能超过100个字符")
    private String author;

    @Schema(description = "重复率")
    private String duplicationRate;

    @Schema(description = "字数")
    private Integer wordCount;

    @Schema(description = "订单状态：0-进行中，1-已完成，2-已取消")
    private Integer status;

    @Schema(description = "完成时间")
    private LocalDateTime completionTime;

    @Schema(description = "处理状态：0-待处理，1-处理中，2-已处理")
    private Integer processingStatus;

    @Schema(description = "订单号，唯一值")
    @Size(max=50, message="订单号，唯一值长度不能超过50个字符")
    private String orderNumber;


}
