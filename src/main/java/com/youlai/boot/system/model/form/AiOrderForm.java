package com.youlai.boot.system.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 订单提交记录表单对象
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Getter
@Setter
@Schema(description = "订单提交记录表单对象")
public class AiOrderForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "订单记录唯一标识")
    private Long id;

    @Schema(description = "论文标题")
    @Size(max=255, message="论文标题长度不能超过255个字符")
    private String title;

    @Schema(description = "论文所属专业")
    @Size(max=255, message="论文所属专业长度不能超过255个字符")
    private String major;

    @Schema(description = "论文字数")
    private Integer wordCount;

    @Schema(description = "提交时间")
    private LocalDateTime createTime;

    @Schema(description = "修改时间")
    private LocalDateTime updateTime;

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "下载链接")
    private String download;

}
