package com.youlai.boot.system.service;

import com.youlai.boot.system.model.entity.AigcRecords;
import com.youlai.boot.system.model.form.AigcRecordsForm;
import com.youlai.boot.system.model.query.AigcRecordsQuery;
import com.youlai.boot.system.model.vo.AigcRecordsVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 订单服务类
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
public interface AigcRecordsService extends IService<AigcRecords> {

    /**
     *订单分页列表
     *
     * @return
     */
    IPage<AigcRecordsVO> getAigcRecordsPage(AigcRecordsQuery queryParams);

    /**
     * 获取订单表单数据
     *
     * @param id 订单ID
     * @return
     */
     AigcRecordsForm getAigcRecordsFormData(Long id);

    /**
     * 新增订单
     *
     * @param formData 订单表单对象
     * @return
     */
    boolean saveAigcRecords(AigcRecordsForm formData);

    /**
     * 修改订单
     *
     * @param id   订单ID
     * @param formData 订单表单对象
     * @return
     */
    boolean updateAigcRecords(Long id, AigcRecordsForm formData);

    /**
     * 删除订单
     *
     * @param ids 订单ID，多个以英文逗号(,)分割
     * @return
     */
    boolean deleteAigcRecordss(String ids);

}
