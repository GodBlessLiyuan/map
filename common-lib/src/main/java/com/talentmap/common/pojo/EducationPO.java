package com.talentmap.common.pojo;

import java.io.Serializable;

/**
 * t_education
 * @author 
 */
public class EducationPO implements Serializable {
    private Integer educId;

    private String name;

    private static final long serialVersionUID = 1L;

    public Integer getEducId() {
        return educId;
    }

    public void setEducId(Integer educId) {
        this.educId = educId;
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
        EducationPO other = (EducationPO) that;
        return (this.getEducId() == null ? other.getEducId() == null : this.getEducId().equals(other.getEducId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getEducId() == null) ? 0 : getEducId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", educId=").append(educId);
        sb.append(", name=").append(name);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}