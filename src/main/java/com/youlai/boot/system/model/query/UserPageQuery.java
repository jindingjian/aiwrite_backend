package com.youlai.boot.system.model.query;

import com.youlai.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.List;

/**
 * 用户分页查询对象
 *
 * @author haoxr
 * @since 2022/1/14
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description ="用户分页查询对象")
public class UserPageQuery extends BasePageQuery {

    @Schema(description="关键字(用户名/昵称/手机号)")
    private String keywords;

    @Schema(description="用户状态")
    private Integer status;

    @Schema(description="部门ID")
    private Long deptId;

    @Schema(description="创建时间范围")
    private List<String> createTime;

    @Schema(description = "用户余额")
    private BigDecimal balance;

    @Schema(description = "父级用户ID，用于管理用户层级关系")
    private Integer parentId;

}
