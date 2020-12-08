package com.talentmap.common.pojo;

import java.io.Serializable;

/**
 * t_isolation
 * @author 
 */
public class IsolationPO implements Serializable {
    private Long isolationId;

    private Long areaId;

    private Long belongs;

    private Long tagId;

    private String name;

    private static final long serialVersionUID = 1L;

    public Long getIsolationId() {
        return isolationId;
    }

    public void setIsolationId(Long isolationId) {
        this.isolationId = isolationId;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public Long getBelongs() {
        return belongs;
    }

    public void setBelongs(Long belongs) {
        this.belongs = belongs;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        IsolationPO other = (IsolationPO) that;
        return (this.getIsolationId() == null ? other.getIsolationId() == null : this.getIsolationId().equals(other.getIsolationId()))
            && (this.getAreaId() == null ? other.getAreaId() == null : this.getAreaId().equals(other.getAreaId()))
            && (this.getBelongs() == null ? other.getBelongs() == null : this.getBelongs().equals(other.getBelongs()))
            && (this.getTagId() == null ? other.getTagId() == null : this.getTagId().equals(other.getTagId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getIsolationId() == null) ? 0 : getIsolationId().hashCode());
        result = prime * result + ((getAreaId() == null) ? 0 : getAreaId().hashCode());
        result = prime * result + ((getBelongs() == null) ? 0 : getBelongs().hashCode());
        result = prime * result + ((getTagId() == null) ? 0 : getTagId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", isolationId=").append(isolationId);
        sb.append(", areaId=").append(areaId);
        sb.append(", belongs=").append(belongs);
        sb.append(", tagId=").append(tagId);
        sb.append(", name=").append(name);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}