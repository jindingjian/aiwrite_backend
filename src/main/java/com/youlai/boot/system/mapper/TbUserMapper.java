package com.youlai.boot.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.youlai.boot.system.model.entity.TbUser;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.youlai.boot.system.model.query.TbUserQuery;
import com.youlai.boot.system.model.vo.TbUserVO;
import org.apache.ibatis.annotations.Mapper;

/**
 * 普通用户，存储用户的基本信息和父子级关系Mapper接口
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
@Mapper
public interface TbUserMapper extends BaseMapper<TbUser> {

    /**
     * 获取普通用户，存储用户的基本信息和父子级关系分页数据
     *
     * @param page 分页对象
     * @param queryParams 查询参数
     * @return
     */
    Page<TbUserVO> getTbUserPage(Page<TbUserVO> page, TbUserQuery queryParams);

}
