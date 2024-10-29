package com.youlai.boot.system.service;

import com.youlai.boot.system.model.entity.AiOrder;
import com.youlai.boot.system.model.form.AiOrderForm;
import com.youlai.boot.system.model.query.AiOrderQuery;
import com.youlai.boot.system.model.vo.AiOrderVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * 订单提交记录服务类
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
public interface AiOrderService extends IService<AiOrder> {

    /**
     *订单提交记录分页列表
     *
     * @return
     */
    IPage<AiOrderVO> getAiOrderPage(AiOrderQuery queryParams);

    /**
     * 获取订单提交记录表单数据
     *
     * @param id 订单提交记录ID
     * @return
     */
     AiOrderForm getAiOrderFormData(Long id);

    /**
     * 新增订单提交记录
     *
     * @param formData 订单提交记录表单对象
     * @return
     */
    boolean saveAiOrder(AiOrderForm formData);

    /**
     * 修改订单提交记录
     *
     * @param id   订单提交记录ID
     * @param formData 订单提交记录表单对象
     * @return
     */
    boolean updateAiOrder(Long id, AiOrderForm formData);

    /**
     * 删除订单提交记录
     *
     * @param ids 订单提交记录ID，多个以英文逗号(,)分割
     * @return
     */
    boolean deleteAiOrders(String ids);
    List<AiOrderForm> getAiOrderByUserId(Long userId);
}
