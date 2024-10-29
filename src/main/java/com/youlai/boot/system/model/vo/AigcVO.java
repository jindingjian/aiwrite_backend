package com.youlai.boot.system.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

/**
 * AIGC订单视图对象
 *
 * @author tshy
 * @since 2024-10-21 07:23
 */
@Getter
@Setter
@Schema( description = "AIGC订单视图对象")
public class AigcVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "自增主键")
    private Integer id;
    @Schema(description = "订单标题")
    private String title;
    @Schema(description = "支付状态：0-未支付，1-已支付，2-退款")
    private Integer paymentStatus;
    @Schema(description = "支付时间")
    private LocalDateTime paymentTime;
    @Schema(description = "支付金额")
    private BigDecimal paymentAmount;
    @Schema(description = "作者姓名")
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
    private String orderNumber;
    @Schema(description = "创建时间")
    private LocalDateTime createdAt;
    @Schema(description = "修改时间")
    private LocalDateTime updatedAt;
}
