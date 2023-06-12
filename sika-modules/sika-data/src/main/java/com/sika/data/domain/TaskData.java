package com.sika.data.domain;

import com.sika.common.core.annotation.Excel;
import com.sika.common.core.web.domain.BaseEntity;
import com.sika.system.api.domain.SysFile;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 资料对象 task_data
 * 
 * @author 小吴来哩
 * @date 2023-04-21
 */
public class TaskData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 资料编号 */
    private Long dId;

    /** 资料名称 */
    @Excel(name = "资料名称")
    private String dTitle;

    /** 资料存储路径 */
    @Excel(name = "资料存储路径")
    private String dLocal;

    /**
     * <p>
     *     通过file模块的domain对象生成资料VO
     * </p>
     * <strong style="color:red">
     *     使用该构造函数时需要重新设置id值
     * </strong>
     *
     * @param sysFile
     */
    public TaskData(SysFile sysFile) {
        this.dTitle = sysFile.getName();
        this.dLocal = sysFile.getUrl();
    }

    public TaskData() {
    }


    public void setdId(Long dId)
    {
        this.dId = dId;
    }

    public Long getdId() 
    {
        return dId;
    }
    public void setdTitle(String dTitle) 
    {
        this.dTitle = dTitle;
    }

    public String getdTitle() 
    {
        return dTitle;
    }
    public void setdLocal(String dLocal) 
    {
        this.dLocal = dLocal;
    }

    public String getdLocal() 
    {
        return dLocal;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("dId", getdId())
            .append("dTitle", getdTitle())
            .append("dLocal", getdLocal())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
