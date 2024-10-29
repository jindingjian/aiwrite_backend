package com.youlai.boot.system.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youlai.boot.system.mapper.AigcRecordsMapper;
import com.youlai.boot.system.service.AigcRecordsService;
import com.youlai.boot.system.model.entity.AigcRecords;
import com.youlai.boot.system.model.form.AigcRecordsForm;
import com.youlai.boot.system.model.query.AigcRecordsQuery;
import com.youlai.boot.system.model.vo.AigcRecordsVO;
import com.youlai.boot.system.converter.AigcRecordsConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 订单服务实现类
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Service
@RequiredArgsConstructor
public class AigcRecordsServiceImpl extends ServiceImpl<AigcRecordsMapper, AigcRecords> implements AigcRecordsService {

    private final AigcRecordsConverter aigcRecordsConverter;

    /**
    * 获取订单分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AigcRecordsVO>} 订单分页列表
    */
    @Override
    public IPage<AigcRecordsVO> getAigcRecordsPage(AigcRecordsQuery queryParams) {
        Page<AigcRecordsVO> pageVO = this.baseMapper.getAigcRecordsPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }
    
    /**
     * 获取订单表单数据
     *
     * @param id 订单ID
     * @return
     */
    @Override
    public AigcRecordsForm getAigcRecordsFormData(Long id) {
        AigcRecords entity = this.getById(id);
        return aigcRecordsConverter.toForm(entity);
    }
    
    /**
     * 新增订单
     *
     * @param formData 订单表单对象
     * @return
     */
    @Override
    public boolean saveAigcRecords(AigcRecordsForm formData) {
        AigcRecords entity = aigcRecordsConverter.toEntity(formData);
        return this.save(entity);
    }
    
    /**
     * 更新订单
     *
     * @param id   订单ID
     * @param formData 订单表单对象
     * @return
     */
    @Override
    public boolean updateAigcRecords(Long id,AigcRecordsForm formData) {
        AigcRecords entity = aigcRecordsConverter.toEntity(formData);
        return this.updateById(entity);
    }
    
    /**
     * 删除订单
     *
     * @param ids 订单ID，多个以英文逗号(,)分割
     * @return
     */
    @Override
    public boolean deleteAigcRecordss(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的订单数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }

}
