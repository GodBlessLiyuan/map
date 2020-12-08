package com.talentmap.common.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * t_talent_general
 * @author 
 */
public class TalentGeneralPO implements Serializable {
    private Long tgId;

    private String name;

    private String avatar;

    /**
     * 1：男
2：女
     */
    private Byte sex;

    private Date birth;

    private String hometown;

    private String location;

    private Integer educId;

    private String workunit;

    private String position;

    private String socialWork;

    private String field;

    private Integer natureId;

    private String phone;

    private BigDecimal longitude;

    private BigDecimal latitude;

    private String contact;

    private String highSchool;

    private Date createTime;

    private Date updateTime;

    private Long userId;

    private Byte china;

    private Long isolationId;

    private Byte dr;

    private Long source;

    private static final long serialVersionUID = 1L;

    public Long getTgId() {
        return tgId;
    }

    public void setTgId(Long tgId) {
        this.tgId = tgId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getHometown() {
        return hometown;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getEducId() {
        return educId;
    }

    public void setEducId(Integer educId) {
        this.educId = educId;
    }

    public String getWorkunit() {
        return workunit;
    }

    public void setWorkunit(String workunit) {
        this.workunit = workunit;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getSocialWork() {
        return socialWork;
    }

    public void setSocialWork(String socialWork) {
        this.socialWork = socialWork;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public Integer getNatureId() {
        return natureId;
    }

    public void setNatureId(Integer natureId) {
        this.natureId = natureId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getHighSchool() {
        return highSchool;
    }

    public void setHighSchool(String highSchool) {
        this.highSchool = highSchool;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Byte getChina() {
        return china;
    }

    public void setChina(Byte china) {
        this.china = china;
    }

    public Long getIsolationId() {
        return isolationId;
    }

    public void setIsolationId(Long isolationId) {
        this.isolationId = isolationId;
    }

    public Byte getDr() {
        return dr;
    }

    public void setDr(Byte dr) {
        this.dr = dr;
    }

    public Long getSource() {
        return source;
    }

    public void setSource(Long source) {
        this.source = source;
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
        TalentGeneralPO other = (TalentGeneralPO) that;
        return (this.getTgId() == null ? other.getTgId() == null : this.getTgId().equals(other.getTgId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getAvatar() == null ? other.getAvatar() == null : this.getAvatar().equals(other.getAvatar()))
            && (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
            && (this.getBirth() == null ? other.getBirth() == null : this.getBirth().equals(other.getBirth()))
            && (this.getHometown() == null ? other.getHometown() == null : this.getHometown().equals(other.getHometown()))
            && (this.getLocation() == null ? other.getLocation() == null : this.getLocation().equals(other.getLocation()))
            && (this.getEducId() == null ? other.getEducId() == null : this.getEducId().equals(other.getEducId()))
            && (this.getWorkunit() == null ? other.getWorkunit() == null : this.getWorkunit().equals(other.getWorkunit()))
            && (this.getPosition() == null ? other.getPosition() == null : this.getPosition().equals(other.getPosition()))
            && (this.getSocialWork() == null ? other.getSocialWork() == null : this.getSocialWork().equals(other.getSocialWork()))
            && (this.getField() == null ? other.getField() == null : this.getField().equals(other.getField()))
            && (this.getNatureId() == null ? other.getNatureId() == null : this.getNatureId().equals(other.getNatureId()))
            && (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
            && (this.getLongitude() == null ? other.getLongitude() == null : this.getLongitude().equals(other.getLongitude()))
            && (this.getLatitude() == null ? other.getLatitude() == null : this.getLatitude().equals(other.getLatitude()))
            && (this.getContact() == null ? other.getContact() == null : this.getContact().equals(other.getContact()))
            && (this.getHighSchool() == null ? other.getHighSchool() == null : this.getHighSchool().equals(other.getHighSchool()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getChina() == null ? other.getChina() == null : this.getChina().equals(other.getChina()))
            && (this.getIsolationId() == null ? other.getIsolationId() == null : this.getIsolationId().equals(other.getIsolationId()))
            && (this.getDr() == null ? other.getDr() == null : this.getDr().equals(other.getDr()))
            && (this.getSource() == null ? other.getSource() == null : this.getSource().equals(other.getSource()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getTgId() == null) ? 0 : getTgId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getAvatar() == null) ? 0 : getAvatar().hashCode());
        result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
        result = prime * result + ((getBirth() == null) ? 0 : getBirth().hashCode());
        result = prime * result + ((getHometown() == null) ? 0 : getHometown().hashCode());
        result = prime * result + ((getLocation() == null) ? 0 : getLocation().hashCode());
        result = prime * result + ((getEducId() == null) ? 0 : getEducId().hashCode());
        result = prime * result + ((getWorkunit() == null) ? 0 : getWorkunit().hashCode());
        result = prime * result + ((getPosition() == null) ? 0 : getPosition().hashCode());
        result = prime * result + ((getSocialWork() == null) ? 0 : getSocialWork().hashCode());
        result = prime * result + ((getField() == null) ? 0 : getField().hashCode());
        result = prime * result + ((getNatureId() == null) ? 0 : getNatureId().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getLongitude() == null) ? 0 : getLongitude().hashCode());
        result = prime * result + ((getLatitude() == null) ? 0 : getLatitude().hashCode());
        result = prime * result + ((getContact() == null) ? 0 : getContact().hashCode());
        result = prime * result + ((getHighSchool() == null) ? 0 : getHighSchool().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getChina() == null) ? 0 : getChina().hashCode());
        result = prime * result + ((getIsolationId() == null) ? 0 : getIsolationId().hashCode());
        result = prime * result + ((getDr() == null) ? 0 : getDr().hashCode());
        result = prime * result + ((getSource() == null) ? 0 : getSource().hashCode());
        return result;
    }

    @Override
    public String toString() {

        return (null == name ? "" : name.trim()) +
                (null == sex ? "" : sex) +
                (null == birth ? "" : fixBirth()) +
                (null == hometown ? "" : hometown.trim()) +
                (null == location ? "" : location.trim()) +
                (null == educId ? "" : educId) +
                (null == workunit ? "" : workunit.trim()) +
                (null == position ? "" : position.trim()) +
                (null == socialWork ? "" : socialWork.trim()) +
                (null == field ? "" : field.trim()) +
                (null == natureId ? "" : natureId) +
                (null == phone ? "" : phone.trim()) +
                (null == longitude ? "" : longitude.stripTrailingZeros()) +
                //保留小数点后十位，保持与数据库一致setScale(10, BigDecimal.ROUND_HALF_UP)
                (null == latitude ? "" : latitude.stripTrailingZeros()) +
                (null == contact ? "" : contact.trim()) +
                (null == highSchool ? "" : highSchool.trim());
    }

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
    private String fixBirth(){
        String str =   dateFormat.format(this.birth);
        return str;
    }
}