package com.youlai.boot.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.bo.UserBO;
import com.youlai.boot.system.model.entity.AiOrder;
import com.youlai.boot.system.model.entity.AigcOrder;
import com.youlai.boot.system.model.entity.User;
import com.youlai.boot.system.model.form.AiOrderForm;
import com.youlai.boot.system.model.form.AigcOrderForm;
import com.youlai.boot.system.model.query.UserPageQuery;
import com.youlai.boot.system.model.form.UserForm;
import com.youlai.boot.common.annotation.DataPermission;
import com.youlai.boot.system.model.dto.UserAuthInfo;
import com.youlai.boot.system.model.dto.UserExportDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.math.BigDecimal;
import java.util.List;

/**
 * 用户持久层
 *
 * @author haoxr
 * @since 2022/1/14
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * 获取用户分页列表
     *
     * @param page
     * @param queryParams 查询参数
     * @return
     */
    @DataPermission(deptAlias = "u")
    Page<UserBO> getUserPage(Page<UserBO> page, UserPageQuery queryParams);

    /**
     * 获取用户表单详情
     *
     * @param userId 用户ID
     * @return
     */
    UserForm getUserFormData(Long userId);

    /**
     * 根据用户名获取认证信息
     *
     * @param username
     * @return
     */
    UserAuthInfo getUserAuthInfo(String username);

    /**
     * 获取导出用户列表
     *
     * @param queryParams
     * @return
     */
    @DataPermission(deptAlias = "u")
    List<UserExportDTO> listExportUsers(UserPageQuery queryParams);

    /**
     * 获取用户个人中心信息
     *
     * @param userId 用户ID
     * @return
     */
    UserBO getUserProfile(Long userId);

    // 查询用户余额
    @Select("SELECT balance FROM aiwrite.sys_user WHERE id = #{userId}")
    BigDecimal getBalanceByUserId(Long userId);

    //根据username获取用户Id
    @Select("SELECT id FROM aiwrite.sys_user WHERE username = #{username}")
    Long getUserIdByUsername(String username);

    //根据userid查询parentid等于userid的用户
    @Select("SELECT * FROM aiwrite.sys_user WHERE parent_id = #{userId}")
    List<UserForm> getParentIdByUserId(Long userId);

    //更新账户余额
    @Update("UPDATE aiwrite.sys_user SET aiwrite.sys_user.balance = #{balance} WHERE id = #{userId} ")
    Boolean updateBalance(BigDecimal balance,Long userId);



}
