package com.sika.media.domain;

import com.sika.common.core.annotation.Excel;
import com.sika.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 视频资源对象 media_video
 * 
 * @author 小吴来哩
 * @date 2023-05-16
 */
public class MediaVideo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 视频id */
    @Excel(name = "视频id")
    private String id;

    /** 视频标题 */
    @Excel(name = "视频标题")
    private String videoName;

    /** 云端视频id */
    private String videoSourceId;

    /** 原始文件名 */
    @Excel(name = "原始文件名")
    private String videoOriginalName;

    public void setId(String id)
    {
        this.id = id;
    }

    public String getId()
    {
        return id;
    }
    public void setVideoName(String videoName) 
    {
        this.videoName = videoName;
    }

    public String getVideoName() 
    {
        return videoName;
    }
    public void setVideoSourceId(String videoSourceId) 
    {
        this.videoSourceId = videoSourceId;
    }

    public String getVideoSourceId() 
    {
        return videoSourceId;
    }
    public void setVideoOriginalName(String videoOriginalName) 
    {
        this.videoOriginalName = videoOriginalName;
    }

    public String getVideoOriginalName() 
    {
        return videoOriginalName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("videoName", getVideoName())
            .append("videoSourceId", getVideoSourceId())
            .append("videoOriginalName", getVideoOriginalName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
