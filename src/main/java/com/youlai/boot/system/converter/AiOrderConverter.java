package com.youlai.boot.system.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.entity.AiOrder;
import com.youlai.boot.system.model.form.AiOrderForm;

/**
 * 订单提交记录对象转换器
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Mapper(componentModel = "spring")
public interface AiOrderConverter{

    AiOrderForm toForm(AiOrder entity);

    AiOrder toEntity(AiOrderForm formData);
}