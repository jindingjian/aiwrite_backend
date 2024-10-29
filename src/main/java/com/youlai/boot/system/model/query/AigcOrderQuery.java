package com.youlai.boot.system.model.query;

import com.youlai.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * aigc文件上传记录分页查询对象
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Schema(description ="aigc文件上传记录查询对象")
@Getter
@Setter
public class AigcOrderQuery extends BasePageQuery {

    @Schema(description = "主键ID")
    private Long id;
    @Schema(description = "用户ID")
    private Long userId;
    @Schema(description = "文件名")
    private String fileName;
    @Schema(description = "文件大小（以字节为单位）")
    private Long fileSize;
    @Schema(description = "上传时间")
    private List<String> uploadTime;
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
    private String analysis;
    @Schema(description = "其他信息")
    private String message;
    @Schema(description = "记录创建时间")
    private LocalDateTime createTime;
    @Schema(description = "记录修改时间")
    private LocalDateTime updateTime;
    @Schema(description = "下载链接")
    private String download;
}
