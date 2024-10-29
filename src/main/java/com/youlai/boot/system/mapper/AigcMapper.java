package com.youlai.boot.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youlai.boot.system.model.entity.Aigc;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.query.AigcQuery;
import com.youlai.boot.system.model.vo.AigcVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * AIGC订单Mapper接口
 *
 * @author tshy
 * @since 2024-10-21 07:23
 */
@Mapper
public interface AigcMapper extends BaseMapper<Aigc> {

    /**
     * 获取AIGC订单分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return
     */
    Page<AigcVO> getAigcordersPage(Page<AigcVO> page, AigcQuery queryParams);

}
