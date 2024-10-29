package com.youlai.boot.system.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.entity.TbUser;
import com.youlai.boot.system.model.form.TbUserForm;

/**
 * 普通用户，存储用户的基本信息和父子级关系对象转换器
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
@Mapper(componentModel = "spring")
public interface TbUserConverter{

    TbUserForm toForm(TbUser entity);

    TbUser toEntity(TbUserForm formData);
}