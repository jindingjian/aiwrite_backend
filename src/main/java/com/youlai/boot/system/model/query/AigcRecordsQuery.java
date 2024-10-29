package com.youlai.boot.system.model.query;

import com.youlai.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 订单分页查询对象
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Schema(description ="订单查询对象")
@Getter
@Setter
public class AigcRecordsQuery extends BasePageQuery {

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
