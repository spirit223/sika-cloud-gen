package com.sika.task.service.impl;

import java.util.List;

import com.sika.task.domain.SubmitRecord;
import org.springframework.stereotype.Service;
import com.sika.task.mapper.TaskSubmitMapper;
import com.sika.task.domain.TaskSubmit;
import com.sika.task.service.ITaskSubmitService;

import javax.annotation.Resource;

/**
 * 提交记录Service业务层处理
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
@Service
public class TaskSubmitServiceImpl implements ITaskSubmitService 
{
    @Resource
    private TaskSubmitMapper taskSubmitMapper;

    @Override
    public List<SubmitRecord> selectUncommittedList(Long userId) {
        List<SubmitRecord> records = taskSubmitMapper.selectUncommittedByUserId(userId);
        records.forEach(recode -> {recode.setUserId(userId);});
        return records;
    }

    @Override
    public List<SubmitRecord> selectUncommittedList(TaskSubmit taskSubmit) {

        return null;
    }

    /**
     * 查询提交记录
     *
     * @param taskId 题目主键
     * @return 提交记录
     */
    @Override
    public SubmitRecord selectTaskSubmitById(Long taskId)
    {
        String taskContent = taskSubmitMapper.selectTaskById(taskId);
        SubmitRecord submitRecord = new SubmitRecord();
        submitRecord.setTaskContent(taskContent);
        submitRecord.setTaskId(taskId);
        submitRecord.setSubmitContent("");
        return submitRecord;
    }

    /**
     * 查询提交记录列表
     * 
     * @param taskSubmit 提交记录
     * @return 提交记录
     */
    @Override
    public List<SubmitRecord> selectTaskSubmitList(TaskSubmit taskSubmit)
    {
        return taskSubmitMapper.selectTaskSubmitList(taskSubmit);
    }

    /**
     * 新增提交记录
     * 
     * @param taskSubmit 提交记录
     * @return 结果
     */
    @Override
    public int insertTaskSubmit(TaskSubmit taskSubmit)
    {
        return taskSubmitMapper.insertTaskSubmit(taskSubmit);
    }

    /**
     * 修改提交记录
     * 
     * @param taskSubmit 提交记录
     * @return 结果
     */
    @Override
    public int updateTaskSubmit(TaskSubmit taskSubmit)
    {
        return taskSubmitMapper.updateTaskSubmit(taskSubmit);
    }

    /**
     * 批量删除提交记录
     * 
     * @param ids 需要删除的提交记录主键
     * @return 结果
     */
    @Override
    public int deleteTaskSubmitByIds(Long[] ids)
    {
        return taskSubmitMapper.deleteTaskSubmitByIds(ids);
    }

    /**
     * 删除提交记录信息
     * 
     * @param id 提交记录主键
     * @return 结果
     */
    @Override
    public int deleteTaskSubmitById(Long id)
    {
        return taskSubmitMapper.deleteTaskSubmitById(id);
    }
}
