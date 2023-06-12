package com.sika.task.service;

import java.util.List;
import com.sika.task.domain.TaskCorrection;

/**
 * 任务批改Service接口
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
public interface ITaskCorrectionService 
{
    /**
     * 查询任务批改
     * 
     * @param submitId 任务批改主键
     * @return 任务批改
     */
    public TaskCorrection selectTaskCorrectionById(Long submitId);

    /**
     * 查询任务批改列表
     * 
     * @param taskCorrection 任务批改
     * @return 任务批改集合
     */
    public List<TaskCorrection> selectTaskCorrectionList(TaskCorrection taskCorrection);

    /**
     * 新增任务批改
     * 
     * @param taskCorrection 任务批改
     * @return 结果
     */
    public int insertTaskCorrection(TaskCorrection taskCorrection);

    /**
     * 修改任务批改
     * 
     * @param taskCorrection 任务批改
     * @return 结果
     */
    public int updateTaskCorrection(TaskCorrection taskCorrection);

    /**
     * 批量删除任务批改
     * 
     * @param ids 需要删除的任务批改主键集合
     * @return 结果
     */
    public int deleteTaskCorrectionByIds(Long[] ids);

    /**
     * 删除任务批改信息
     * 
     * @param id 任务批改主键
     * @return 结果
     */
    public int deleteTaskCorrectionById(Long id);
}
