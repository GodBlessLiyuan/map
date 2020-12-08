package com.talentmap.web.vo;

import com.talentmap.common.bo.TalentGeneralBO;
import com.talentmap.common.pojo.GeneralPicturePO;
import com.talentmap.common.pojo.TalentGeneralPO;
import com.talentmap.common.utils.DateUtil;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 13:22
 * @description
 */
@Component
@Data
public class TalentGeneralVO implements Serializable {
    private static final long SerialVersionUID = 1L;

    private Long id;
    private String name;
    private Boolean focus;
    private Byte sex;
    private String birth;
    private Integer educId;
    private String educ;
    private String posi;
    private String social;
    private String field;
    private String lgtd;
    private String lati;
    private String contact;
    private String school;
    private String phone;
    private Integer natureId;
    private String nature;
    private String local;
    private String town;
    private String unit;
    private String avatar;
    private Map<String, String> picture;
    private String dataSource;

    // 公共路径
    private static String publicPath;

    /**
     * bos 转 vos
     *
     * @param bos
     * @return
     */
    public static List<TalentGeneralVO> convert(List<TalentGeneralBO> bos) {
        List<TalentGeneralVO> vos = new ArrayList<>();
        for (TalentGeneralBO bo : bos) {
            vos.add(TalentGeneralVO.convert(bo));
        }

        return vos;
    }

    /**
     * bo 转 vo
     *
     * @param bo
     * @return
     */
    public static TalentGeneralVO convert(TalentGeneralBO bo) {
        TalentGeneralVO vo = convert((TalentGeneralPO) bo);
        vo.setEduc(bo.getEduc());
        vo.setNature(bo.getNature());
        vo.setDataSource(bo.getDataSource());
        if (bo.getFocus() == null || bo.getFocus() == 0) {
            vo.setFocus(false);
        } else {
            vo.setFocus(true);
        }
        Map<String, String> picture = new HashMap<>();
        if (bo.getPics() != null) {
            for (GeneralPicturePO po : bo.getPics()) {
                picture.put(String.valueOf(po.getGpId()), publicPath + po.getPicture());
            }
        }
        vo.setPicture(picture);
        return vo;
    }

    /**
     * po 转 vo
     *
     * @param po
     * @return
     */
    public static TalentGeneralVO convert(TalentGeneralPO po) {
        TalentGeneralVO vo = new TalentGeneralVO();
        vo.setId(po.getTgId());
        vo.setName(po.getName());
        vo.setSex(po.getSex());
        vo.setBirth(DateUtil.date2Str(po.getBirth(), DateUtil.YM));
        vo.setEducId(po.getEducId());
        vo.setPosi(po.getPosition());
        vo.setSocial(po.getSocialWork());
        vo.setField(po.getField());
        vo.setLgtd(po.getLongitude() == null ? "" : po.getLongitude().toString());
        vo.setLati(po.getLatitude() == null ? "" : po.getLatitude().toString());
        vo.setContact(po.getContact());
        vo.setSchool(po.getHighSchool());
        vo.setPhone(po.getPhone());
        vo.setNatureId(po.getNatureId());
        vo.setLocal(po.getLocation());
        vo.setTown(po.getHometown());
        vo.setUnit(po.getWorkunit());
        if (null != po.getAvatar()) {
            vo.setAvatar(publicPath + po.getAvatar());
        }
        return vo;
    }

    @Value("${file.publicPath}")
    public void setPublicPath(String publicPath) {
        TalentGeneralVO.publicPath = publicPath;
    }
}
