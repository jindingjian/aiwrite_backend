package com.youlai.boot.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youlai.boot.system.model.entity.AigcRecords;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.query.AigcRecordsQuery;
import com.youlai.boot.system.model.vo.AigcRecordsVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单Mapper接口
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Mapper
public interface AigcRecordsMapper extends BaseMapper<AigcRecords> {

    /**
     * 获取订单分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return
     */
    Page<AigcRecordsVO> getAigcRecordsPage(Page<AigcRecordsVO> page, AigcRecordsQuery queryParams);

}
