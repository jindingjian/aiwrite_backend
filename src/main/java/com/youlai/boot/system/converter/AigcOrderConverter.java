package com.youlai.boot.system.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.entity.AigcOrder;
import com.youlai.boot.system.model.form.AigcOrderForm;

/**
 * aigc文件上传记录对象转换器
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Mapper(componentModel = "spring")
public interface AigcOrderConverter{

    AigcOrderForm toForm(AigcOrder entity);

    AigcOrder toEntity(AigcOrderForm formData);
}