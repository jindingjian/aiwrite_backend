package com.youlai.boot.system.service;

import com.youlai.boot.system.model.entity.TbUser;
import com.youlai.boot.system.model.form.TbUserForm;
import com.youlai.boot.system.model.query.TbUserQuery;
import com.youlai.boot.system.model.vo.TbUserVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 普通用户，存储用户的基本信息和父子级关系服务类
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
public interface TbUserService extends IService<TbUser> {

    /**
     *普通用户，存储用户的基本信息和父子级关系分页列表
     *
     * @return
     */
    IPage<TbUserVO> getTbUserPage(TbUserQuery queryParams);

    /**
     * 获取普通用户，存储用户的基本信息和父子级关系表单数据
     *
     * @param id 普通用户，存储用户的基本信息和父子级关系ID
     * @return
     */
     TbUserForm getTbUserFormData(Long id);

    /**
     * 新增普通用户，存储用户的基本信息和父子级关系
     *
     * @param formData 普通用户，存储用户的基本信息和父子级关系表单对象
     * @return
     */
    boolean saveTbUser(TbUserForm formData);

    /**
     * 修改普通用户，存储用户的基本信息和父子级关系
     *
     * @param id   普通用户，存储用户的基本信息和父子级关系ID
     * @param formData 普通用户，存储用户的基本信息和父子级关系表单对象
     * @return
     */
    boolean updateTbUser(Long id, TbUserForm formData);

    /**
     * 删除普通用户，存储用户的基本信息和父子级关系
     *
     * @param ids 普通用户，存储用户的基本信息和父子级关系ID，多个以英文逗号(,)分割
     * @return
     */
    boolean deleteTbUsers(String ids);

}
