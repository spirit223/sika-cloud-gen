package com.sika.data.service.impl;

import com.sika.common.core.exception.file.FileNameLengthLimitExceededException;
import com.sika.common.core.exception.file.InvalidExtensionException;
import com.sika.common.core.utils.DateUtils;
import com.sika.common.core.utils.file.MimeTypeUtils;
import com.sika.data.domain.TaskData;
import com.sika.data.mapper.TaskDataMapper;
import com.sika.data.service.ITaskDataService;
import com.sika.data.utils.FileUploadUtils;
import com.sika.system.api.RemoteFileService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Objects;

/**
 * 资料Service业务层处理
 * 
 * @author 小吴来哩
 * @date 2023-04-21
 */
@Service
public class TaskDataServiceImpl implements ITaskDataService 
{
    /**
     * 上传文件存储在本地的根路径
     */
    @Value("${file.path}")
    private String localFilePath;

    @Resource
    private TaskDataMapper taskDataMapper;

    @Resource
    private RemoteFileService remoteFileService;

    /**
     * 查询资料
     * 
     * @param dId 资料主键
     * @return 资料
     */
    @Override
    public TaskData selectTaskDataByDId(Long dId)
    {
        return taskDataMapper.selectTaskDataByDId(dId);
    }

    /**
     * 查询资料列表
     * 
     * @param taskData 资料
     * @return 资料
     */
    @Override
    public List<TaskData> selectTaskDataList(TaskData taskData)
    {
        // todo 从本地文件获取文件信息
        return taskDataMapper.selectTaskDataList(taskData);
    }

    /**
     * 新增资料
     * 
     * @param taskData 资料
     * @return 结果
     */
    @Override
    public int insertTaskData(TaskData taskData)
    {
        taskData.setCreateTime(DateUtils.getNowDate());
        return taskDataMapper.insertTaskData(taskData);
    }

    @Override
    @Transactional
    public int insertTaskData(TaskData taskData, MultipartFile multipartFile) throws InvalidExtensionException, IOException {
        // 文件名长度校验
        String filename = multipartFile.getOriginalFilename();
        int fileNameLength = Objects.requireNonNull(filename).length();
        if (fileNameLength > FileUploadUtils.DEFAULT_FILE_NAME_LENGTH)
        {
            throw new FileNameLengthLimitExceededException(FileUploadUtils.DEFAULT_FILE_NAME_LENGTH);
        }
        // 校验文件后缀
        FileUploadUtils.assertAllowed(multipartFile, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
        // 记录插入数据库
        taskData.setdTitle(filename);
        taskData.setCreateTime(DateUtils.getNowDate());
        taskData.setdLocal(localFilePath);
        int insert = taskDataMapper.insertTaskData(taskData);
        // 保存文件
        String absPath = FileUploadUtils.getAbsoluteFile(localFilePath, filename).getAbsolutePath();
        multipartFile.transferTo(Paths.get(absPath));
        return insert;
    }

    @Override
    public int insertDataFile(TaskData taskData, MultipartFile multipartFile) {
        taskData.setCreateTime(DateUtils.getNowDate());
        return taskDataMapper.insertTaskData(taskData);
    }

    /**
     * 修改资料
     * 
     * @param taskData 资料
     * @return 结果
     */
    @Override
    public int updateTaskData(TaskData taskData)
    {
        taskData.setUpdateTime(DateUtils.getNowDate());
        return taskDataMapper.updateTaskData(taskData);
    }

    /**
     * 批量删除资料
     * 
     * @param dIds 需要删除的资料主键
     * @return 结果
     */
    @Override
    public int deleteTaskDataByDIds(Long[] dIds)
    {
        return taskDataMapper.deleteTaskDataByDIds(dIds);
    }

    /**
     * 删除资料信息
     * 
     * @param dId 资料主键
     * @return 结果
     */
    @Override
    public int deleteTaskDataByDId(Long dId)
    {
        return taskDataMapper.deleteTaskDataByDId(dId);
    }
}
