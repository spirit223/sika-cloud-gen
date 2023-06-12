package com.sika.data.mapper;

import java.util.List;
import com.sika.data.domain.TaskData;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * 资料Mapper接口
 * 
 * @author 小吴来哩
 * @date 2023-04-21
 */
public interface TaskDataMapper 
{
    /**
     * 清空数据表
     * @param tableName
     */
    @Update("truncate table task_data")
    void truncate() ;

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

    /**
     * 修改资料
     * 
     * @param taskData 资料
     * @return 结果
     */
    public int updateTaskData(TaskData taskData);

    /**
     * 删除资料
     * 
     * @param dId 资料主键
     * @return 结果
     */
    public int deleteTaskDataByDId(Long dId);

    /**
     * 批量删除资料
     * 
     * @param dIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTaskDataByDIds(Long[] dIds);
}
