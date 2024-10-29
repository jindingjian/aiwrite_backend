package com.youlai.boot.system.model.vo;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

/**
 * 普通用户，存储用户的基本信息和父子级关系视图对象
 *
 * @author tshy
 * @since 2024-10-23 00:09
 */
@Getter
@Setter
@Schema( description = "普通用户，存储用户的基本信息和父子级关系视图对象")
public class UserVO implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;
}
