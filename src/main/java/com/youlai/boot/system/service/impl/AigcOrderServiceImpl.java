package com.youlai.boot.system.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.youlai.boot.system.mapper.AigcOrderMapper;
import com.youlai.boot.system.service.AigcOrderService;
import com.youlai.boot.system.model.entity.AigcOrder;
import com.youlai.boot.system.model.form.AigcOrderForm;
import com.youlai.boot.system.model.query.AigcOrderQuery;
import com.youlai.boot.system.model.vo.AigcOrderVO;
import com.youlai.boot.system.converter.AigcOrderConverter;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;

/**
 * aigc文件上传记录服务实现类
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Service
@RequiredArgsConstructor
public class AigcOrderServiceImpl extends ServiceImpl<AigcOrderMapper, AigcOrder> implements AigcOrderService {

    private final AigcOrderConverter aigcOrderConverter;

    /**
    * 获取aigc文件上传记录分页列表
    *
    * @param queryParams 查询参数
    * @return {@link IPage<AigcOrderVO>} aigc文件上传记录分页列表
    */
    @Override
    public IPage<AigcOrderVO> getAigcOrderPage(AigcOrderQuery queryParams) {
        Page<AigcOrderVO> pageVO = this.baseMapper.getAigcOrderPage(
                new Page<>(queryParams.getPageNum(), queryParams.getPageSize()),
                queryParams
        );
        return pageVO;
    }

    /**
     * 获取aigc文件上传记录表单数据
     *
     * @param id aigc文件上传记录ID
     * @return
     */
    @Override
    public AigcOrderForm getAigcOrderFormData(Long id) {
        AigcOrder entity = this.getById(id);
        return aigcOrderConverter.toForm(entity);
    }

    /**
     * 新增aigc文件上传记录
     *
     * @param formData aigc文件上传记录表单对象
     * @return
     */
    @Override
    public boolean saveAigcOrder(AigcOrderForm formData) {
        AigcOrder entity = aigcOrderConverter.toEntity(formData);
        return this.save(entity);
    }

    /**
     * 更新aigc文件上传记录
     *
     * @param id   aigc文件上传记录ID
     * @param formData aigc文件上传记录表单对象
     * @return
     */
    @Override
    public boolean updateAigcOrder(Long id,AigcOrderForm formData) {
        AigcOrder entity = aigcOrderConverter.toEntity(formData);
        return this.updateById(entity);
    }

    /**
     * 删除aigc文件上传记录
     *
     * @param ids aigc文件上传记录ID，多个以英文逗号(,)分割
     * @return
     */
    @Override
    public boolean deleteAigcOrders(String ids) {
        Assert.isTrue(StrUtil.isNotBlank(ids), "删除的aigc文件上传记录数据为空");
        // 逻辑删除
        List<Long> idList = Arrays.stream(ids.split(","))
                .map(Long::parseLong)
                .toList();
        return this.removeByIds(idList);
    }
    @Override
    public List<AigcOrderForm> getAigcOrderByUserId(Long userId) {
        return this.getBaseMapper().getAigcOrderByUserId(userId);
    }

}
