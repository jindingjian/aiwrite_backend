package com.youlai.boot.system.service;

import com.youlai.boot.system.mapper.DownloadLinkMapper;
import com.youlai.boot.system.model.entity.DownloadLink;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DownloadLinkService {

    @Autowired
    private DownloadLinkMapper downloadLinkMapper;

    // 保存下载链接
    public void saveDownloadLink(DownloadLink downloadLink) {
        downloadLinkMapper.insertDownloadLink(downloadLink);
    }

    // 获取所有下载链接
    public List<DownloadLink> getAllDownloadLinks() {
        return downloadLinkMapper.selectAllDownloadLinks();
    }

   public  DownloadLink selectDownloadLink(Long userId, String fileName){
        return downloadLinkMapper.selectDownloadLink(userId,fileName);
   }
}
