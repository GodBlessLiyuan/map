package com.talentmap.web.vo;

import com.talentmap.common.bo.TalentFocusBO;
import com.talentmap.common.pojo.FocusPicturePO;
import com.talentmap.common.pojo.TalentFocusPO;
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
public class TalentFocusVO implements Serializable {
    private static final long SerialVersionUID = 1L;

    private Long id;
    private String num;
    private String name;
    private Byte sex;
    private String phone;
    private Integer natureId;
    private String nature;
    private String town;
    private String unit;
    private String social;
    private String avatar;
    private Map<String, String> picture;

    // 公共路径
    private static String publicPath;

    /**
     * pos 转 vos
     *
     * @param bos
     * @return
     */
    public static List<TalentFocusVO> convert(List<TalentFocusBO> bos) {
        List<TalentFocusVO> vos = new ArrayList<>();
        for (TalentFocusBO bo : bos) {
            vos.add(TalentFocusVO.convert(bo));
        }

        return vos;
    }

    /**
     * bo 转 vo
     *
     * @param bo
     * @return
     */
    public static TalentFocusVO convert(TalentFocusBO bo) {
        TalentFocusVO vo = convert((TalentFocusPO) bo);
        vo.setNature(bo.getNature());
        Map<String, String> picture = new HashMap<>();
        if (bo.getPics() != null) {
            for (FocusPicturePO po : bo.getPics()) {
                picture.put(String.valueOf(po.getFpId()), publicPath + po.getPicture());
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
    public static TalentFocusVO convert(TalentFocusPO po) {
        TalentFocusVO vo = new TalentFocusVO();
//        vo.setId(po.getTfId());
//        vo.setNum(po.getNum());
//        vo.setName(po.getName());
//        vo.setSex(po.getSex());
//        vo.setPhone(po.getPhone());
//        vo.setNatureId(po.getNatureId());
//        vo.setTown(po.getHometown());
//        vo.setUnit(po.getUnitPosition());
//        vo.setSocial(po.getSocialWork());
//        if (null != po.getAvatar()) {
//            vo.setAvatar(publicPath + po.getAvatar());
//        }
        return vo;
    }

    @Value("${file.publicPath}")
    public void setPublicPath(String publicPath) {
        TalentFocusVO.publicPath = publicPath;
    }
}
