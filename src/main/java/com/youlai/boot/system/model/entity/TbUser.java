package com.youlai.boot.system.model.entity;

import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.TableName;
import com.youlai.boot.common.base.BaseEntity;

/**
 * 普通用户，存储用户的基本信息和父子级关系实体对象
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
@Getter
@Setter
@TableName("tb_user")
public class TbUser extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户名，必须唯一
     */
    private String username;
    /**
     * 加密后的用户密码
     */
    private String password;
    /**
     * 用户账户余额
     */
    private BigDecimal balance;
    /**
     * 父用户ID，表示父子级关系
     */
    private Long parentId;
}
