package com.youlai.boot.system.service.impl;

import com.youlai.boot.system.converter.UserConverter;
import com.youlai.boot.system.mapper.UserRoleMapper;
import com.youlai.boot.system.model.entity.User;
import com.youlai.boot.system.model.entity.UserRole;
import com.youlai.boot.system.model.form.UserForm;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youlai.boot.system.mapper.TbUserMapper;
import com.youlai.boot.system.service.TbUserService;
import com.youlai.boot.system.model.entity.TbUser;
import com.youlai.boot.system.model.form.TbUserForm;
import com.youlai.boot.system.model.query.TbUserQuery;
import com.youlai.boot.system.model.vo.TbUserVO;
import com.youlai.boot.system.converter.TbUserConverter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 普通用户，存储用户的基本信息和父子级关系服务实现类
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
@Service
@RequiredArgsConstructor
public class TbUserServiceImpl extends ServiceImpl<TbUserMapper, TbUser> implements TbUserService {

    private final TbUserConverter tbUserConverter;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private UserRoleMapper userRoleMapper;

    /**
    * 获取普通用户，存储用户的基本信息和父子级关系分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<TbUserVO>} 普通用户，存储用户的基本信息和父子级关系分页列表
    */
    @Override
    public IPage<TbUserVO> getTbUserPage(TbUserQuery queryParams) {
        Page<TbUserVO> pageVO = this.baseMapper.getTbUserPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }

    /**
     * 获取普通用户，存储用户的基本信息和父子级关系表单数据
     *
     * @param id 普通用户，存储用户的基本信息和父子级关系ID
     * @return
     */
    @Override
    public TbUserForm getTbUserFormData(Long id) {
        TbUser entity = this.getById(id);
        return tbUserConverter.toForm(entity);
    }

    /**
     * 新增普通用户，存储用户的基本信息和父子级关系
     *
     * @param formData 普通用户，存储用户的基本信息和父子级关系表单对象
     * @return
     */
    @Override
    public boolean saveTbUser(TbUserForm formData) {
        TbUser entity = tbUserConverter.toEntity(formData);
        boolean save = this.save(entity);
        UserForm sysUser = new UserForm();
        sysUser.setUsername(formData.getUsername());
        sysUser.setPassword(formData.getPassword());
        sysUser.setDeptId(3L);
        userService.saveUser(sysUser);
        Long userIdByUsername = userService.getUserIdByUsername(sysUser.getUsername());
        boolean b = userRoleMapper.saveRoleUser(3L, userIdByUsername);
        System.out.println(b);
        return save;
    }

    /**
     * 更新普通用户，存储用户的基本信息和父子级关系
     *
     * @param id   普通用户，存储用户的基本信息和父子级关系ID
     * @param formData 普通用户，存储用户的基本信息和父子级关系表单对象
     * @return
     */
    @Override
    public boolean updateTbUser(Long id,TbUserForm formData) {
        TbUser entity = tbUserConverter.toEntity(formData);
        return this.updateById(entity);
    }

    /**
     * 删除普通用户，存储用户的基本信息和父子级关系
     *
     * @param ids 普通用户，存储用户的基本信息和父子级关系ID，多个以英文逗号(,)分割
     * @return
     */
    @Override
    public boolean deleteTbUsers(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的普通用户，存储用户的基本信息和父子级关系数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
