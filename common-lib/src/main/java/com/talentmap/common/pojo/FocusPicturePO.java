package com.talentmap.common.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * t_focus_picture
 * @author 
 */
public class FocusPicturePO implements Serializable {
    private Long fpId;

    private Long tfId;

    private String picture;

    private Date createTime;

    private static final long serialVersionUID = 1L;

    public Long getFpId() {
        return fpId;
    }

    public void setFpId(Long fpId) {
        this.fpId = fpId;
    }

    public Long getTfId() {
        return tfId;
    }

    public void setTfId(Long tfId) {
        this.tfId = tfId;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        FocusPicturePO other = (FocusPicturePO) that;
        return (this.getFpId() == null ? other.getFpId() == null : this.getFpId().equals(other.getFpId()))
            && (this.getTfId() == null ? other.getTfId() == null : this.getTfId().equals(other.getTfId()))
            && (this.getPicture() == null ? other.getPicture() == null : this.getPicture().equals(other.getPicture()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getFpId() == null) ? 0 : getFpId().hashCode());
        result = prime * result + ((getTfId() == null) ? 0 : getTfId().hashCode());
        result = prime * result + ((getPicture() == null) ? 0 : getPicture().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", fpId=").append(fpId);
        sb.append(", tfId=").append(tfId);
        sb.append(", picture=").append(picture);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}