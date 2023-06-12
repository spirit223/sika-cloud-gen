package com.sika.system.api;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import com.sika.common.core.constant.ServiceNameConstants;
import com.sika.common.core.domain.R;
import com.sika.system.api.domain.SysFile;
import com.sika.system.api.factory.RemoteFileFallbackFactory;

import java.util.List;

/**
 * 文件服务
 */
@FeignClient(contextId = "remoteFileService", value = ServiceNameConstants.FILE_SERVICE, fallbackFactory = RemoteFileFallbackFactory.class)
public interface RemoteFileService
{
    /**
     * 上传文件
     *
     * @param file 文件信息
     * @return 结果
     */
    @PostMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<SysFile> upload(@RequestPart(value = "file") MultipartFile file);

    /**
     * 文件列表获取
     * @return 文件列表
     */
    @GetMapping("list")
    R<List<String>> list();
}
