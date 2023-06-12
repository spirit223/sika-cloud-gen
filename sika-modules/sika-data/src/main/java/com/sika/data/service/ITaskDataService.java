package com.sika.data.service;

import java.io.IOException;
import java.util.List;

import com.sika.common.core.exception.file.InvalidExtensionException;
import com.sika.data.domain.TaskData;
import org.springframework.web.multipart.MultipartFile;

/**
 * 资料Service接口
 * 
 * @author 小吴来哩
 * @date 2023-04-21
 */
public interface ITaskDataService 
{
    /**
     * 查询资料
     * 
     * @param dId 资料主键
     * @return 资料
     */
    public TaskData selectTaskDataByDId(Long dId);

    /**
     * 查询资料列表
     * 
     * @param taskData 资料
     * @return 资料集合
     */
    public List<TaskData> selectTaskDataList(TaskData taskData);

    /**
     * 新增资料
     * 
     * @param taskData 资料
     * @return 结果
     */
    public int insertTaskData(TaskData taskData);

    int insertTaskData(TaskData taskData, MultipartFile multipartFile) throws InvalidExtensionException, IOException;

    int insertDataFile(TaskData taskData, MultipartFile multipartFile);

    /**
     * 修改资料
     * 
     * @param taskData 资料
     * @return 结果
     */
    public int updateTaskData(TaskData taskData);

    /**
     * 批量删除资料
     * 
     * @param dIds 需要删除的资料主键集合
     * @return 结果
     */
    public int deleteTaskDataByDIds(Long[] dIds);

    /**
     * 删除资料信息
     * 
     * @param dId 资料主键
     * @return 结果
     */
    public int deleteTaskDataByDId(Long dId);
}
