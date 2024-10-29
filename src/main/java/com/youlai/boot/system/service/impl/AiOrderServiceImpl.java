package com.youlai.boot.system.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youlai.boot.system.mapper.AiOrderMapper;
import com.youlai.boot.system.service.AiOrderService;
import com.youlai.boot.system.model.entity.AiOrder;
import com.youlai.boot.system.model.form.AiOrderForm;
import com.youlai.boot.system.model.query.AiOrderQuery;
import com.youlai.boot.system.model.vo.AiOrderVO;
import com.youlai.boot.system.converter.AiOrderConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * 订单提交记录服务实现类
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Service
@RequiredArgsConstructor
public class AiOrderServiceImpl extends ServiceImpl<AiOrderMapper, AiOrder> implements AiOrderService {

    private final AiOrderConverter aiOrderConverter;

    /**
    * 获取订单提交记录分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AiOrderVO>} 订单提交记录分页列表
    */
    @Override
    public IPage<AiOrderVO> getAiOrderPage(AiOrderQuery queryParams) {
        Page<AiOrderVO> pageVO = this.baseMapper.getAiOrderPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }

    /**
     * 获取订单提交记录表单数据
     *
     * @param id 订单提交记录ID
     * @return
     */
    @Override
    public AiOrderForm getAiOrderFormData(Long id) {
        AiOrder entity = this.getById(id);
        return aiOrderConverter.toForm(entity);
    }

    /**
     * 新增订单提交记录
     *
     * @param formData 订单提交记录表单对象
     * @return
     */
    @Override
    public boolean saveAiOrder(AiOrderForm formData) {
        AiOrder entity = aiOrderConverter.toEntity(formData);
        return this.save(entity);
    }

    /**
     * 更新订单提交记录
     *
     * @param id   订单提交记录ID
     * @param formData 订单提交记录表单对象
     * @return
     */
    @Override
    public boolean updateAiOrder(Long id,AiOrderForm formData) {
        AiOrder entity = aiOrderConverter.toEntity(formData);
        return this.updateById(entity);
    }

    /**
     * 删除订单提交记录
     *
     * @param ids 订单提交记录ID，多个以英文逗号(,)分割
     * @return
     */
    @Override
    public boolean deleteAiOrders(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的订单提交记录数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }
    @Override
    public List<AiOrderForm> getAiOrderByUserId(Long userId) {
        return this.getBaseMapper().getAiOrderByUserId(userId);
    }
}
