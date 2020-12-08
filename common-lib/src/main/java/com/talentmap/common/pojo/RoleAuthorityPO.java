package com.talentmap.common.pojo;

import java.io.Serializable;

/**
 * t_role_authority
 * @author 
 */
public class RoleAuthorityPO implements Serializable {
    private Long roleAuthorityId;

    private String authorityName;

    /**
     * 0关闭   1开放
     */
    private Byte status;

    private Long roleId;

    private Long authorityId;

    private static final long serialVersionUID = 1L;

    public Long getRoleAuthorityId() {
        return roleAuthorityId;
    }

    public void setRoleAuthorityId(Long roleAuthorityId) {
        this.roleAuthorityId = roleAuthorityId;
    }

    public String getAuthorityName() {
        return authorityName;
    }

    public void setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Long authorityId) {
        this.authorityId = authorityId;
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
        RoleAuthorityPO other = (RoleAuthorityPO) that;
        return (this.getRoleAuthorityId() == null ? other.getRoleAuthorityId() == null : this.getRoleAuthorityId().equals(other.getRoleAuthorityId()))
            && (this.getAuthorityName() == null ? other.getAuthorityName() == null : this.getAuthorityName().equals(other.getAuthorityName()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getRoleId() == null ? other.getRoleId() == null : this.getRoleId().equals(other.getRoleId()))
            && (this.getAuthorityId() == null ? other.getAuthorityId() == null : this.getAuthorityId().equals(other.getAuthorityId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getRoleAuthorityId() == null) ? 0 : getRoleAuthorityId().hashCode());
        result = prime * result + ((getAuthorityName() == null) ? 0 : getAuthorityName().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getRoleId() == null) ? 0 : getRoleId().hashCode());
        result = prime * result + ((getAuthorityId() == null) ? 0 : getAuthorityId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", roleAuthorityId=").append(roleAuthorityId);
        sb.append(", authorityName=").append(authorityName);
        sb.append(", status=").append(status);
        sb.append(", roleId=").append(roleId);
        sb.append(", authorityId=").append(authorityId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}