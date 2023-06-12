package com.sika.file.service;

import com.sika.common.core.exception.file.FileUploadException;
import com.sika.file.utils.FileUploadUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.IOFileFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.LinkOption;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 吴畅
 * @创建时间 2023/4/22 - 6:56
 */
@Service
@Primary
public class CustomLocalFileServiceImpl implements ISysFileService{
    /**
     * 资源映射路径 前缀
     */
    // /static
    @Value("${file.prefix}")
    public String localFilePrefix;

    /**
     * 域名或本机访问地址
     */
    // 127.0.0.1:9300
    @Value("${file.domain}")
    public String domain;

    /**
     * 上传文件存储在本地的根路径
     */
    // D:/sika/uploadPath
    @Value("${file.path}")
    protected String localFilePath;

    @Override
    public String uploadFile(MultipartFile file) throws Exception {
        File checkFile = new File(localFilePath + File.separator + file.getOriginalFilename());
        if (checkFile.isFile()) {
            if (checkFile.exists()) {
                throw new FileUploadException("文件已经存在");
            }
        }

        String name = FileUploadUtils.uploadWithDesignateName(localFilePath, file);
        return domain + localFilePrefix + name;
    }

    public List<String> fileList() {
        assertDirExisted(localFilePath);
        Collection<File> files = FileUtils.listFilesAndDirs(new File(localFilePath), new IOFileFilter() {
            @Override
            public boolean accept(File file) {
                return true;
            }

            @Override
            public boolean accept(File dir, String name) {
                return true;
            }
        }, null);
        return files.stream().map(file -> file.getAbsoluteFile().toString()).collect(Collectors.toList());
    }

    /**
     * 确保目录文件夹存在
     * @param filePath
     */
    private void assertDirExisted(String filePath) {
        if (!new File(filePath).exists()) {
            if (FileUtils.isDirectory(new File(filePath), LinkOption.NOFOLLOW_LINKS)) {
                return;
            } else {
                try {
                    FileUtils.createParentDirectories(new File(filePath + File.separator + "*.*"));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
