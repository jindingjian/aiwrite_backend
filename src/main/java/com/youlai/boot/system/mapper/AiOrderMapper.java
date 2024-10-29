package com.youlai.boot.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youlai.boot.system.model.entity.AiOrder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.form.AiOrderForm;
import com.youlai.boot.system.model.query.AiOrderQuery;
import com.youlai.boot.system.model.vo.AiOrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 订单提交记录Mapper接口
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Mapper
public interface AiOrderMapper extends BaseMapper<AiOrder> {

    /**
     * 获取订单提交记录分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return
     */
    Page<AiOrderVO> getAiOrderPage(Page<AiOrderVO> page, AiOrderQuery queryParams);

    //通过userid查询aigc订单记录
    @Select("SELECT * FROM aiwrite.tb_ai_order WHERE user_id = #{userId}")
    List<AiOrderForm> getAiOrderByUserId(Long userId);
}
