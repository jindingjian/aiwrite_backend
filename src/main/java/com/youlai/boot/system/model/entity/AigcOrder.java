package com.youlai.boot.system.model.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.youlai.boot.common.base.BaseEntity;

/**
 * aigc文件上传记录实体对象
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Getter
@Setter
@TableName("tb_aigc_order")
public class AigcOrder extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Long userId;
    /**
     * 文件名
     */
    private String fileName;
    /**
     * 文件大小（以字节为单位）
     */
    private Long fileSize;
    /**
     * 上传时间
     */
    private LocalDateTime uploadTime;
    /**
     * 总字数
     */
    private Integer totalWordCount;
    /**
     * AI生成字数
     */
    private Integer aiGeneratedWordCount;
    /**
     * AI生成比例（例如：75.00）
     */
    private BigDecimal aiPercentage;
    /**
     * 人工写作比例（例如：25.00）
     */
    private BigDecimal humanPercentage;
    /**
     * 人工写作字数
     */
    private Integer humanWrittenWordCount;
    /**
     * 分析结果
     */
    private String analysis;
    /**
     * 记录创建时间
     */
    private LocalDateTime createTime;
    /**
     * 记录修改时间
     */
    private LocalDateTime updateTime;
    private String download;
}
