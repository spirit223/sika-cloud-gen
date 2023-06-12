package com.sika.data.domain;

import com.sika.common.core.annotation.Excel;
import com.sika.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author 吴畅
 * @创建时间 2023/4/23 - 11:04
 */
public class DateFile  extends BaseEntity {
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
     * 文件内容
     * */
    private MultipartFile file;

    public Long getdId() {
        return dId;
    }

    public void setdId(Long dId) {
        this.dId = dId;
    }

    public String getdTitle() {
        return dTitle;
    }

    public void setdTitle(String dTitle) {
        this.dTitle = dTitle;
    }

    public String getdLocal() {
        return dLocal;
    }

    public void setdLocal(String dLocal) {
        this.dLocal = dLocal;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("dId", getdId())
                .append("dTitle", getdTitle())
                .append("dLocal", getdLocal())
                .append("file", getFile())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
