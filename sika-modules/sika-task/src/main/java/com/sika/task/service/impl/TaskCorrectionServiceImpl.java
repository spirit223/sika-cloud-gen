package com.sika.task.service.impl;

import java.util.List;
import com.sika.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sika.task.mapper.TaskCorrectionMapper;
import com.sika.task.domain.TaskCorrection;
import com.sika.task.service.ITaskCorrectionService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 任务批改Service业务层处理
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
@Service
public class TaskCorrectionServiceImpl implements ITaskCorrectionService 
{
    @Resource
    private TaskCorrectionMapper taskCorrectionMapper;

    /**
     * 查询任务批改
     * 
     * @param submitId 任务批改主键
     * @return 任务批改
     */
    @Override
    public TaskCorrection selectTaskCorrectionById(Long submitId)
    {
        return taskCorrectionMapper.selectTaskCorrectionById(submitId);
    }

    /**
     * 查询任务批改列表
     * 
     * @param taskCorrection 任务批改
     * @return 任务批改
     */
    @Override
    public List<TaskCorrection> selectTaskCorrectionList(TaskCorrection taskCorrection)
    {
        return taskCorrectionMapper.selectTaskCorrectionList(taskCorrection);
    }

    /**
     * 新增任务批改
     * 
     * @param taskCorrection 任务批改
     * @return 结果
     */
    @Override
    @Transactional
    public int insertTaskCorrection(TaskCorrection taskCorrection)
    {
        taskCorrection.setCreateTime(DateUtils.getNowDate());
        int updateSubmit = taskCorrectionMapper.insertCorrectionToSubmit(taskCorrection);
        int insertCorrection = taskCorrectionMapper.insertTaskCorrection(taskCorrection);
        if (updateSubmit > 0 && insertCorrection > 0) {
            return insertCorrection;
        }
        return 0;
    }

    /**
     * 修改任务批改
     * 
     * @param taskCorrection 任务批改
     * @return 结果
     */
    @Override
    public int updateTaskCorrection(TaskCorrection taskCorrection)
    {
        taskCorrection.setUpdateTime(DateUtils.getNowDate());
        return taskCorrectionMapper.updateTaskCorrection(taskCorrection);
    }

    /**
     * 批量删除任务批改
     * 
     * @param ids 需要删除的任务批改主键
     * @return 结果
     */
    @Override
    public int deleteTaskCorrectionByIds(Long[] ids)
    {
        return taskCorrectionMapper.deleteTaskCorrectionByIds(ids);
    }

    /**
     * 删除任务批改信息
     * 
     * @param id 任务批改主键
     * @return 结果
     */
    @Override
    public int deleteTaskCorrectionById(Long id)
    {
        return taskCorrectionMapper.deleteTaskCorrectionById(id);
    }
}
