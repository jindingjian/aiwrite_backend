package com.youlai.boot.system.model.form;

import java.io.Serial;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import jakarta.validation.constraints.*;

/**
 * aigc文件上传记录表单对象
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Getter
@Setter
@Schema(description = "aigc文件上传记录表单对象")
public class AigcOrderForm implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "主键ID")
    private Long id;

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "文件名")
    @Size(max=255, message="文件名长度不能超过255个字符")
    private String fileName;

    @Schema(description = "文件大小（以字节为单位）")
    private Long fileSize;

    @Schema(description = "上传时间")
    private LocalDateTime uploadTime;

    @Schema(description = "总字数")
    private Integer totalWordCount;

    @Schema(description = "AI生成字数")
    private Integer aiGeneratedWordCount;

    @Schema(description = "AI生成比例（例如：75.00）")
    private BigDecimal aiPercentage;

    @Schema(description = "人工写作比例（例如：25.00）")
    private BigDecimal humanPercentage;

    @Schema(description = "人工写作字数")
    private Integer humanWrittenWordCount;

    @Schema(description = "分析结果")
    @NotBlank(message = "分析结果不能为空")
    private String analysis;


    @Schema(description = "记录创建时间")
    private LocalDateTime createTime;

    @Schema(description = "记录修改时间")
    private LocalDateTime updateTime;

    @Schema(description = "下载链接")
    private String download;
}
