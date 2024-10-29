package com.youlai.boot.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youlai.boot.system.model.entity.AigcOrder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.form.AigcOrderForm;
import com.youlai.boot.system.model.query.AigcOrderQuery;
import com.youlai.boot.system.model.vo.AigcOrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * aigc文件上传记录Mapper接口
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Mapper
public interface AigcOrderMapper extends BaseMapper<AigcOrder> {

    /**
     * 获取aigc文件上传记录分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return
     */
    Page<AigcOrderVO> getAigcOrderPage(Page<AigcOrderVO> page, AigcOrderQuery queryParams);

    //通过userid查询aigc订单记录
    @Select("SELECT * FROM aiwrite.tb_aigc_order WHERE user_id = #{userId}")
    List<AigcOrderForm> getAigcOrderByUserId(Long userId);

}
