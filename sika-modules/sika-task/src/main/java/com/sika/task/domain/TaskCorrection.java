package com.sika.task.domain;

import com.sika.common.core.annotation.Excel;
import com.sika.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 任务批改对象 task_correction
 * 
 * @author 小吴来哩
 */
public class TaskCorrection extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 批改id */
    private Long id;

    /** 任务id */
    @Excel(name = "任务id")
    private Long taskId;

    /** 任务内容 */
    @Excel(name = "任务内容")
    private String taskContent;

    /** 任务从属部门 */
    @Excel(name = "任务从属部门")
    private Long taskDept;

    /** 提交id */
    private Long submitId;

    private Long submitUserId;

    /** 提交用户 */
    @Excel(name = "提交用户")
    private String submitUser;

    /** 提交内容 */
    @Excel(name = "提交内容")
    private String submitContent;

    /** 批改结果 */
    @Excel(name = "批改结果")
    private Long correctResult;




    public Long getSubmitUserId() {
        return submitUserId;
    }

    public void setSubmitUserId(Long submitUserId) {
        this.submitUserId = submitUserId;
    }

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }
    public void setTaskContent(String taskContent) 
    {
        this.taskContent = taskContent;
    }

    public String getTaskContent() 
    {
        return taskContent;
    }
    public void setTaskDept(Long taskDept) 
    {
        this.taskDept = taskDept;
    }

    public Long getTaskDept() 
    {
        return taskDept;
    }
    public void setSubmitId(Long submitId) 
    {
        this.submitId = submitId;
    }

    public Long getSubmitId() 
    {
        return submitId;
    }
    public void setSubmitUser(String submitUser) 
    {
        this.submitUser = submitUser;
    }

    public String getSubmitUser() 
    {
        return submitUser;
    }
    public void setSubmitContent(String submitContent) 
    {
        this.submitContent = submitContent;
    }

    public String getSubmitContent() 
    {
        return submitContent;
    }
    public void setCorrectResult(Long correctResult) 
    {
        this.correctResult = correctResult;
    }

    public Long getCorrectResult() 
    {
        return correctResult;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("taskId", getTaskId())
            .append("taskContent", getTaskContent())
            .append("taskDept", getTaskDept())
            .append("submitId", getSubmitId())
            .append("submitUserId", getSubmitUserId())
            .append("submitUser", getSubmitUser())
            .append("submitContent", getSubmitContent())
            .append("correctResult", getCorrectResult())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
