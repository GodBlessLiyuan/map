package com.talentmap.common.pojo;

import java.io.Serializable;

/**
 * t_talent_famous
 * @author 
 */
public class TalentFamousPO implements Serializable {
    private Long tfsId;

    private Long tgId;

    private Long tfId;

    private Integer num;

    private Long isolationId;

    private static final long serialVersionUID = 1L;

    public Long getTfsId() {
        return tfsId;
    }

    public void setTfsId(Long tfsId) {
        this.tfsId = tfsId;
    }

    public Long getTgId() {
        return tgId;
    }

    public void setTgId(Long tgId) {
        this.tgId = tgId;
    }

    public Long getTfId() {
        return tfId;
    }

    public void setTfId(Long tfId) {
        this.tfId = tfId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
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
        TalentFamousPO other = (TalentFamousPO) that;
        return (this.getTfsId() == null ? other.getTfsId() == null : this.getTfsId().equals(other.getTfsId()))
            && (this.getTgId() == null ? other.getTgId() == null : this.getTgId().equals(other.getTgId()))
            && (this.getTfId() == null ? other.getTfId() == null : this.getTfId().equals(other.getTfId()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getIsolationId() == null ? other.getIsolationId() == null : this.getIsolationId().equals(other.getIsolationId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getTfsId() == null) ? 0 : getTfsId().hashCode());
        result = prime * result + ((getTgId() == null) ? 0 : getTgId().hashCode());
        result = prime * result + ((getTfId() == null) ? 0 : getTfId().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getIsolationId() == null) ? 0 : getIsolationId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", tfsId=").append(tfsId);
        sb.append(", tgId=").append(tgId);
        sb.append(", tfId=").append(tfId);
        sb.append(", num=").append(num);
        sb.append(", isolationId=").append(isolationId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}