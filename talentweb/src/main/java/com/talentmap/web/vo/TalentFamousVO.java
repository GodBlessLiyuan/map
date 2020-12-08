package com.talentmap.web.vo;

import com.talentmap.common.bo.TalentFocusBO;
import com.talentmap.common.pojo.TalentFocusPO;
import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 13:22
 * @description
 */
@Component
@Data
public class TalentFamousVO implements Serializable {
    private static final long SerialVersionUID = 1L;

    private Long id;
    private String name;
    private String nature;
    private String town;
    private String unit;
    private String avatar;

    // 公共路径
    private static String publicPath;

    /**
     * bos 转 vos
     *
     * @param bos
     * @return
     */
    public static List<TalentFamousVO> convert(List<TalentFocusBO> bos) {
        List<TalentFamousVO> vos = new ArrayList<>();
        for (TalentFocusBO po : bos) {
            vos.add(TalentFamousVO.convert(po));
        }

        return vos;
    }

    /**
     * po 转 vo
     *
     * @param po
     * @return
     */
    public static TalentFamousVO convert(TalentFocusBO po) {
        TalentFamousVO vo = new TalentFamousVO();
//        vo.setId(po.getTfId());
//        vo.setName(po.getName());
//        vo.setNature(po.getNature());
//        vo.setTown(po.getHometown());
//        vo.setUnit(po.getUnitPosition());
//        if (null != po.getAvatar()) {
//            vo.setAvatar(publicPath + po.getAvatar());
//        }
        return vo;
    }

    @Value("${file.publicPath}")
    public void setPublicPath(String publicPath) {
        TalentFamousVO.publicPath = publicPath;
    }
}
