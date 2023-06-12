package com.sika.task.domain;

import com.sika.common.core.annotation.Excel;
import com.sika.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 教学任务对象 task_task
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
public class TaskTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务id */
    private Long id;

    /** 任务内容 */
    @Excel(name = "任务内容")
    private String taskContent;

    /** 任务答案 */
    private String taskAnswer;

    /** 从属部门 */
    @Excel(name = "从属部门")
    private Long taskDept;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTaskContent(String taskContent) 
    {
        this.taskContent = taskContent;
    }

    public String getTaskContent() 
    {
        return taskContent;
    }
    public void setTaskAnswer(String taskAnswer) 
    {
        this.taskAnswer = taskAnswer;
    }

    public String getTaskAnswer() 
    {
        return taskAnswer;
    }
    public void setTaskDept(Long taskDept) 
    {
        this.taskDept = taskDept;
    }

    public Long getTaskDept() 
    {
        return taskDept;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("taskContent", getTaskContent())
            .append("taskAnswer", getTaskAnswer())
            .append("taskDept", getTaskDept())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
