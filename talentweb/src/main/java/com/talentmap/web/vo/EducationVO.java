package com.talentmap.web.vo;

import com.talentmap.common.pojo.EducationPO;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/3/3 11:12
 * @description: TODO
 * @version: 1.0
 */
@Data
public class EducationVO implements Serializable {
    private static final long SerialVersionUID = 1L;

    private Integer educId;
    private String name;

    /**
     * pos 转 vos
     *
     * @param pos
     * @return
     */
    public static List<EducationVO> convert(List<EducationPO> pos) {
        List<EducationVO> vos = new ArrayList<>();
        for (EducationPO po : pos) {
            vos.add(convert(po));
        }

        return vos;
    }

    /**
     * po 转 vo
     *
     * @param po
     * @return
     */
    public static EducationVO convert(EducationPO po) {
        EducationVO vo = new EducationVO();

        vo.setEducId(po.getEducId());
        vo.setName(po.getName());

        return vo;
    }
}
