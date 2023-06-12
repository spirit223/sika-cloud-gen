package com.sika.task.service;

import java.util.List;

import com.sika.task.domain.SubmitRecord;
import com.sika.task.domain.TaskSubmit;

/**
 * 提交记录Service接口
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
public interface ITaskSubmitService 
{
    List<SubmitRecord> selectUncommittedList(Long userId);

    List<SubmitRecord> selectUncommittedList(TaskSubmit taskSubmit);

    /**
     * 查询提交记录
     *
     * @param id 提交记录主键
     * @return 提交记录
     */
    public SubmitRecord selectTaskSubmitById(Long id);

    /**
     * 查询提交记录列表
     * 
     * @param taskSubmit 提交记录
     * @return 提交记录集合
     */
    public List<SubmitRecord> selectTaskSubmitList(TaskSubmit taskSubmit);

    /**
     * 新增提交记录
     * 
     * @param taskSubmit 提交记录
     * @return 结果
     */
    public int insertTaskSubmit(TaskSubmit taskSubmit);

    /**
     * 修改提交记录
     * 
     * @param taskSubmit 提交记录
     * @return 结果
     */
    public int updateTaskSubmit(TaskSubmit taskSubmit);

    /**
     * 批量删除提交记录
     * 
     * @param ids 需要删除的提交记录主键集合
     * @return 结果
     */
    public int deleteTaskSubmitByIds(Long[] ids);

    /**
     * 删除提交记录信息
     * 
     * @param id 提交记录主键
     * @return 结果
     */
    public int deleteTaskSubmitById(Long id);
}
