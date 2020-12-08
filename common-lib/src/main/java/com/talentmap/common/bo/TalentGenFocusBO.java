package com.talentmap.common.bo;

import com.talentmap.common.pojo.TalentFocusPO;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Description:
 * @author: liyuan
 * @data 2020-04-14 09:06
 */
@Data
public class TalentGenFocusBO {
    @Override
    public String toString() {
        return (null == name ? "" : name.trim()) +
                (null == sex ? "" : sex) +
                (null == birth ? "" : birth) +
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
                (null == latitude ? "" : latitude.stripTrailingZeros()) +
                (null == contact ? "" : contact.trim()) +
                (null == highSchool ? "" : highSchool.trim());
    }

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

    private Long tfId;
}
