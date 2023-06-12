package com.sika.task.service.impl;

import java.util.List;
import com.sika.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sika.task.mapper.TaskTaskMapper;
import com.sika.task.domain.TaskTask;
import com.sika.task.service.ITaskTaskService;

import javax.annotation.Resource;

/**
 * 教学任务Service业务层处理
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
@Service
public class TaskTaskServiceImpl implements ITaskTaskService 
{
    @Resource
    private TaskTaskMapper taskTaskMapper;

    /**
     * 查询教学任务
     * 
     * @param id 教学任务主键
     * @return 教学任务
     */
    @Override
    public TaskTask selectTaskTaskById(Long id, String username)
    {
        TaskTask taskTask = taskTaskMapper.selectTaskTaskById(id);
        if (taskTaskMapper.noQueryAnswer(username)) {
            taskTask.setTaskAnswer("");
        }
        return taskTask;
    }

    @Override
    public boolean noQueryAnswer(String username) {
        return taskTaskMapper.noQueryAnswer(username);
    }

    /**
     * 查询教学任务列表
     * 
     * @param taskTask 教学任务
     * @return 教学任务
     */
    @Override
    public List<TaskTask> selectTaskTaskList(TaskTask taskTask, String username)
    {
        List<TaskTask> taskTasks = taskTaskMapper.selectTaskTaskList(taskTask);
        if (taskTaskMapper.noQueryAnswer(username)) {
            for (TaskTask task : taskTasks) {
                task.setTaskAnswer("");
            }
        }
        return taskTasks;
    }

    @Override
    public List<TaskTask> selectTaskTaskList(TaskTask taskTask) {
        return taskTaskMapper.selectTaskTaskList(taskTask);
    }

    /**
     * 新增教学任务
     * 
     * @param taskTask 教学任务
     * @return 结果
     */
    @Override
    public int insertTaskTask(TaskTask taskTask)
    {
        taskTask.setCreateTime(DateUtils.getNowDate());
        return taskTaskMapper.insertTaskTask(taskTask);
    }

    /**
     * 修改教学任务
     * 
     * @param taskTask 教学任务
     * @return 结果
     */
    @Override
    public int updateTaskTask(TaskTask taskTask)
    {
        taskTask.setUpdateTime(DateUtils.getNowDate());
        return taskTaskMapper.updateTaskTask(taskTask);
    }

    /**
     * 批量删除教学任务
     * 
     * @param ids 需要删除的教学任务主键
     * @return 结果
     */
    @Override
    public int deleteTaskTaskByIds(Long[] ids)
    {
        return taskTaskMapper.deleteTaskTaskByIds(ids);
    }

    /**
     * 删除教学任务信息
     * 
     * @param id 教学任务主键
     * @return 结果
     */
    @Override
    public int deleteTaskTaskById(Long id)
    {
        return taskTaskMapper.deleteTaskTaskById(id);
    }
}
