package com.youlai.boot.system.converter;

import org.mapstruct.Mapper;
import com.youlai.boot.system.model.entity.Aigc;
import com.youlai.boot.system.model.form.AigcForm;

/**
 * AIGC订单对象转换器
 *
 * @author tshy
 * @since 2024-10-21 07:23
 */
@Mapper(componentModel = "spring")
public interface AigcConverter {

    AigcForm toForm(Aigc entity);

    Aigc toEntity(AigcForm formData);
}
