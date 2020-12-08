package com.talentmap.common.pojo;

import java.io.Serializable;

/**
 * t_talent_focus
 * @author 
 */
public class TalentFocusPO implements Serializable {
    private Long tfId;

    private Long tgId;

    private Long isolationId;

    private static final long serialVersionUID = 1L;

    public Long getTfId() {
        return tfId;
    }

    public void setTfId(Long tfId) {
        this.tfId = tfId;
    }

    public Long getTgId() {
        return tgId;
    }

    public void setTgId(Long tgId) {
        this.tgId = tgId;
    }

    public Long getIsolationId() {
        return isolationId;
    }

    public void setIsolationId(Long isolationId) {
        this.isolationId = isolationId;
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
        TalentFocusPO other = (TalentFocusPO) that;
        return (this.getTfId() == null ? other.getTfId() == null : this.getTfId().equals(other.getTfId()))
            && (this.getTgId() == null ? other.getTgId() == null : this.getTgId().equals(other.getTgId()))
            && (this.getIsolationId() == null ? other.getIsolationId() == null : this.getIsolationId().equals(other.getIsolationId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getTfId() == null) ? 0 : getTfId().hashCode());
        result = prime * result + ((getTgId() == null) ? 0 : getTgId().hashCode());
        result = prime * result + ((getIsolationId() == null) ? 0 : getIsolationId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", tfId=").append(tfId);
        sb.append(", tgId=").append(tgId);
        sb.append(", isolationId=").append(isolationId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}