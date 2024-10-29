package com.youlai.boot.system.model.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Set;

/**
 * 用户认证信息
 *
 * @author haoxr
 * @since 2022/10/22
 *
 */
@Data
public class UserAuthInfo {

    private Long userId;

    private String username;

    private String nickname;

    private Long deptId;

    private String password;

    private Integer status;

    private Set<String> roles;

    private Set<String> perms;

    private Integer dataScope;

    private BigDecimal balance;

    private Integer parentId;


}
