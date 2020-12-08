package com.talentmap.common.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * t_general_picture
 * @author 
 */
public class GeneralPicturePO implements Serializable {
    private Long gpId;

    private Long tgId;

    private String picture;

    private Date createTime;

    private static final long serialVersionUID = 1L;

    public Long getGpId() {
        return gpId;
    }

    public void setGpId(Long gpId) {
        this.gpId = gpId;
    }

    public Long getTgId() {
        return tgId;
    }

    public void setTgId(Long tgId) {
        this.tgId = tgId;
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
        GeneralPicturePO other = (GeneralPicturePO) that;
        return (this.getGpId() == null ? other.getGpId() == null : this.getGpId().equals(other.getGpId()))
            && (this.getTgId() == null ? other.getTgId() == null : this.getTgId().equals(other.getTgId()))
            && (this.getPicture() == null ? other.getPicture() == null : this.getPicture().equals(other.getPicture()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getGpId() == null) ? 0 : getGpId().hashCode());
        result = prime * result + ((getTgId() == null) ? 0 : getTgId().hashCode());
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
        sb.append(", gpId=").append(gpId);
        sb.append(", tgId=").append(tgId);
        sb.append(", picture=").append(picture);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}