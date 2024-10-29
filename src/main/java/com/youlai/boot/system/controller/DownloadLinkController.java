package com.youlai.boot.system.controller;

import com.youlai.boot.system.model.entity.DownloadLink;
import com.youlai.boot.system.service.DownloadLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/download")
public class DownloadLinkController {

    @Autowired
    private DownloadLinkService downloadLinkService;

    // 保存下载链接
    @PostMapping("/save-download-link")
    public String saveDownloadLink(@RequestBody DownloadLink downloadLink) {
        downloadLinkService.saveDownloadLink(downloadLink);
        return "下载链接保存成功";
    }

    // 获取所有下载链接
    @GetMapping("/download-links")
    public List<DownloadLink> getAllDownloadLinks() {
        return downloadLinkService.getAllDownloadLinks();
    }

    //获取下载地址
    @GetMapping("/download-url")
    public DownloadLink getAllDownloadLink(Long userId,String fileName) {
        return downloadLinkService.selectDownloadLink(userId,fileName);
    }
}
