package com.youlai.boot.system.converter;

import org.mapstruct.Mapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.entity.AigcRecords;
import com.youlai.boot.system.model.form.AigcRecordsForm;

/**
 * 订单对象转换器
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Mapper(componentModel = "spring")
public interface AigcRecordsConverter{

    AigcRecordsForm toForm(AigcRecords entity);

    AigcRecords toEntity(AigcRecordsForm formData);
}