package com.youlai.boot.system.model.query;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.youlai.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 普通用户，存储用户的基本信息和父子级关系分页查询对象
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
@Schema(description ="普通用户，存储用户的基本信息和父子级关系查询对象")
@Getter
@Setter
public class TbUserQuery extends BasePageQuery {

    @Schema(description = "用户ID")
    private Long id;
    @Schema(description = "用户名，必须唯一")
    private String username;
    @Schema(description = "加密后的用户密码")
    private String password;
    @Schema(description = "用户账户余额")
    private BigDecimal balance;
    @Schema(description = "父用户ID，表示父子级关系")
    private Long parentId;
    @Schema(description = "用户创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;
    @Schema(description = "用户更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;
}
