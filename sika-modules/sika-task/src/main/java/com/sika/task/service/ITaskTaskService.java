package com.sika.task.service;

import java.util.List;
import com.sika.task.domain.TaskTask;

/**
 * 教学任务Service接口
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
public interface ITaskTaskService 
{
    /**
     * 查询教学任务
     * 
     * @param id 教学任务主键
     * @return 教学任务
     */
    public TaskTask selectTaskTaskById(Long id, String username);

    /**
     * 判断用户身份是否为学生
     * @param username
     * @return
     */
    boolean noQueryAnswer(String username);

    /**
     * 查询教学任务列表
     * 
     * @param taskTask 教学任务
     * @return 教学任务集合
     */
    public List<TaskTask> selectTaskTaskList(TaskTask taskTask, String username);

    List<TaskTask> selectTaskTaskList(TaskTask taskTask);

    /**
     * 新增教学任务
     * 
     * @param taskTask 教学任务
     * @return 结果
     */
    public int insertTaskTask(TaskTask taskTask);

    /**
     * 修改教学任务
     * 
     * @param taskTask 教学任务
     * @return 结果
     */
    public int updateTaskTask(TaskTask taskTask);

    /**
     * 批量删除教学任务
     * 
     * @param ids 需要删除的教学任务主键集合
     * @return 结果
     */
    public int deleteTaskTaskByIds(Long[] ids);

    /**
     * 删除教学任务信息
     * 
     * @param id 教学任务主键
     * @return 结果
     */
    public int deleteTaskTaskById(Long id);
}
