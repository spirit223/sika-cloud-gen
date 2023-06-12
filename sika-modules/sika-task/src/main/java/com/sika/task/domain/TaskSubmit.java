package com.sika.task.domain;

import com.sika.common.core.annotation.Excel;
import com.sika.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 提交记录对象 task_submit
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
public class TaskSubmit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 提交id */
    private Long id;

    /** 提交用户 */
    private Long userId;

    /** 提交内容 */
    @Excel(name = "提交内容")
    private String submitContent;

    /** 任务id */
    @Excel(name = "任务id")
    private Long taskId;

    /** 批改结果 */
    private Long correctResult;

    /** 批改备注 */
    private String correctRemark;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setSubmitContent(String submitContent) 
    {
        this.submitContent = submitContent;
    }

    public String getSubmitContent() 
    {
        return submitContent;
    }
    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }
    public void setCorrectResult(Long correctResult) 
    {
        this.correctResult = correctResult;
    }

    public Long getCorrectResult() 
    {
        return correctResult;
    }
    public void setCorrectRemark(String correctRemark) 
    {
        this.correctRemark = correctRemark;
    }

    public String getCorrectRemark() 
    {
        return correctRemark;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("submitContent", getSubmitContent())
            .append("taskId", getTaskId())
            .append("correctResult", getCorrectResult())
            .append("correctRemark", getCorrectRemark())
            .toString();
    }
}
