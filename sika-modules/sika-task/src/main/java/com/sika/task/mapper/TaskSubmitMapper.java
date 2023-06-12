package com.sika.task.mapper;

import java.util.List;

import com.sika.task.domain.SubmitRecord;
import com.sika.task.domain.TaskSubmit;

/**
 * 提交记录Mapper接口
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
public interface TaskSubmitMapper 
{

    /**
     * 查询当前用户所有未提交的题目
     * @param userId 当前用户id
     * @param deptId 用户所属部门
     * @return 未提交题目列表, 题目包含id, 主体, 创建信息
     */
    List<SubmitRecord> selectUncommitted(Long userId, Long deptId);

    List<SubmitRecord> selectUncommittedByUserId(Long userId);

    /**
     * 查询提交记录
     * 
     * @param  taskId 提交记录主键
     * @return 提交记录
     */
    public String selectTaskById(Long taskId);

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
     * 删除提交记录
     * 
     * @param id 提交记录主键
     * @return 结果
     */
    public int deleteTaskSubmitById(Long id);

    /**
     * 批量删除提交记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTaskSubmitByIds(Long[] ids);
}
