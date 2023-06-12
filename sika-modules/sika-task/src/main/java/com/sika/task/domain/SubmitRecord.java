package com.sika.task.domain;

import com.sika.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author 吴畅
 */
public class SubmitRecord extends BaseEntity {

    private Long submitId;
    private Long userId;
    private String submitContent;
    private Long taskId;
    private String taskContent;
    private Boolean correctResult;

    public Long getSubmitId() {
        return submitId;
    }

    public void setSubmitId(Long submitId) {
        this.submitId = submitId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getSubmitContent() {
        return submitContent;
    }

    public void setSubmitContent(String submitContent) {
        this.submitContent = submitContent;
    }

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public String getTaskContent() {
        return taskContent;
    }

    public void setTaskContent(String taskContent) {
        this.taskContent = taskContent;
    }

    public Boolean getCorrectResult() {
        return correctResult;
    }

    public void setCorrectResult(Boolean correctResult) {
        this.correctResult = correctResult;
    }



    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("submitId", getSubmitId())
                .append("userId", getUserId())
                .append("submitContent", getSubmitContent())
                .append("taskId", getTaskId())
                .append("taskContent", getTaskContent())
                .append("correctResult", getCorrectResult())
                .toString();
    }
}
