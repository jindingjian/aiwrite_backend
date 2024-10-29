package com.youlai.boot.system.model.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableName;
import com.youlai.boot.common.base.BaseEntity;

/**
 * 订单提交记录实体对象
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Getter
@Setter
@TableName("tb_ai_order")
public class AiOrder extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 论文标题
     */
    private String title;
    /**
     * 论文所属专业
     */
    private String major;
    /**
     * 论文字数
     */
    private Integer wordCount;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;
    private Long userId;
    private String download;
}
