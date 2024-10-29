package com.youlai.boot.system.mapper;


import com.youlai.boot.system.model.entity.DownloadLink;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DownloadLinkMapper {
    // 保存下载链接
    void insertDownloadLink(DownloadLink downloadLink);

    // 获取所有下载链接
    List<DownloadLink> selectAllDownloadLinks();

    //根据用户id和文件名称寻找全部信息
    @Select("select * from download_links where user_id = #{userId} and file_name = #{fileName}")
    DownloadLink selectDownloadLink(Long userId, String fileName);

}
