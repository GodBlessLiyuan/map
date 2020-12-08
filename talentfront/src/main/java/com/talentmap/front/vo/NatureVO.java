package com.talentmap.front.vo;

import com.talentmap.common.pojo.NaturePO;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ChenXU
 * @version 1.0
 * @date Created in 2020/03/04 09:21
 * @description 人才地图前端模块
 */
@Data
public
class NatureVO implements Serializable {
    private static final long SerialVersionUID = 1L;

    private Integer typeId;
    private String name;

    /**
     * pos 转 vos
     *
     * @param pos
     * @return
     */
    public static List<NatureVO> convert(List<NaturePO> pos) {
        List<NatureVO> vos = new ArrayList<>();
        for (NaturePO po : pos) {
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
    public static NatureVO convert(NaturePO po) {
        NatureVO vo = new NatureVO();
        vo.setTypeId(po.getNatureId());
        vo.setName(po.getName());
        return vo;
    }
}
