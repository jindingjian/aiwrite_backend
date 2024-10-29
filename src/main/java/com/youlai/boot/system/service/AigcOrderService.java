package com.youlai.boot.system.service;

import com.youlai.boot.system.model.entity.AigcOrder;
import com.youlai.boot.system.model.form.AigcOrderForm;
import com.youlai.boot.system.model.query.AigcOrderQuery;
import com.youlai.boot.system.model.vo.AigcOrderVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * aigc文件上传记录服务类
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
public interface AigcOrderService extends IService<AigcOrder> {

    /**
     *aigc文件上传记录分页列表
     *
     * @return
     */
    IPage<AigcOrderVO> getAigcOrderPage(AigcOrderQuery queryParams);

    /**
     * 获取aigc文件上传记录表单数据
     *
     * @param id aigc文件上传记录ID
     * @return
     */
     AigcOrderForm getAigcOrderFormData(Long id);

    /**
     * 新增aigc文件上传记录
     *
     * @param formData aigc文件上传记录表单对象
     * @return
     */
    boolean saveAigcOrder(AigcOrderForm formData);

    /**
     * 修改aigc文件上传记录
     *
     * @param id   aigc文件上传记录ID
     * @param formData aigc文件上传记录表单对象
     * @return
     */
    boolean updateAigcOrder(Long id, AigcOrderForm formData);

    /**
     * 删除aigc文件上传记录
     *
     * @param ids aigc文件上传记录ID，多个以英文逗号(,)分割
     * @return
     */
    boolean deleteAigcOrders(String ids);
    List<AigcOrderForm> getAigcOrderByUserId(Long userId);

}
