package com.youlai.boot.system.model.entity;

import lombok.Data;

@Data
public class DownloadLink {
    private Long id; // 自增ID
    private String fileName; // 文件名
    private Long userId;
    private String url; // 下载链接
    private String createdAt; // 创建时间
}
