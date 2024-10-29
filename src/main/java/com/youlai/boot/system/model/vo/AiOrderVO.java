package com.youlai.boot.system.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

/**
 * 订单提交记录视图对象
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Getter
@Setter
@Schema( description = "订单提交记录视图对象")
public class AiOrderVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "订单记录唯一标识")
    private Long id;
    @Schema(description = "论文标题")
    private String title;
    @Schema(description = "论文所属专业")
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
