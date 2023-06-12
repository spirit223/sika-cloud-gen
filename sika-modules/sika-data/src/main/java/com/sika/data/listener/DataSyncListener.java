package com.sika.data.listener;

import com.sika.common.core.domain.R;
import com.sika.common.security.utils.SecurityUtils;
import com.sika.data.domain.TaskData;
import com.sika.data.mapper.TaskDataMapper;
import com.sika.system.api.RemoteFileService;
import org.springframework.boot.availability.AvailabilityChangeEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.FileTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 应用处于活跃状态, 可以开始处理请求时同时本地数据于数据库信息
 * @author 吴畅
 * @创建时间 2023/4/22 - 7:32
 */
@Component
public class DataSyncListener implements ApplicationListener<AvailabilityChangeEvent> {

    @Resource
    private TaskDataMapper taskDataMapper;

    @Resource
    private RemoteFileService fileService;

    /**
     * 获取本地文件的文件信息, 同步进数据库
     * @param event the event to respond to
     */
    @Override
    public void onApplicationEvent(AvailabilityChangeEvent event) {
        // 清空表数据
        taskDataMapper.truncate();
        R<List<String>> list = fileService.list();
        if (list.getCode() == 200) {
            List<String> data = list.getData();
            List<TaskData> dataList = new ArrayList<>();
            // 过滤目录
            data = data.stream().filter(fileUrl->new File(fileUrl).isFile()).collect(Collectors.toList());
            data.forEach(fileUrl -> {
                FileTime fileTime;
                try {
                    fileTime = Files.readAttributes(Paths.get(fileUrl), BasicFileAttributes.class).creationTime();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                TaskData taskData = new TaskData();
                int separator = fileUrl.lastIndexOf(File.separator);
                String fileName = fileUrl.substring(separator + 1);
                String url = fileUrl.substring(0, separator);
                taskData.setCreateTime(new Date(fileTime.toMillis()));
                taskData.setdTitle(fileName);
                taskData.setdLocal(url);
                taskData.setCreateBy("admin");
                taskData.setUpdateTime(new Date(fileTime.toMillis()));
                taskData.setUpdateBy("admin");
                taskData.setRemark("");
                dataList.add(taskData);
            });
            dataList.forEach(taskDataMapper::insertTaskData);
        }
    }
}
