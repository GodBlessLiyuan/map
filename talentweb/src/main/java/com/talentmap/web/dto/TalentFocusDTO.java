package com.talentmap.web.dto;

import com.talentmap.common.pojo.TalentFocusPO;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 13:02
 * @description
 */
@Data
@AllArgsConstructor
public class TalentFocusDTO {
    private Long id;
    private String name;
    private Byte sex;
    private String town;
    private String unit;
    private String social;
    private Integer type;
    private String phone;
    private MultipartFile avatar;
    private MultipartFile[] picture;
    private List<Long> delIds;
    private String delAva;

    /**
     * dto 转 po
     *
     * @param dto
     * @return
     */
    public static TalentFocusPO convert2PO(TalentFocusDTO dto) {
        TalentFocusPO po = new TalentFocusPO();
        TalentFocusDTO.updatePOByDTO(po, dto);
        return po;
    }

    /**
     * 根据dto更新po
     *
     * @param po
     * @param dto
     */
    public static void updatePOByDTO(TalentFocusPO po, TalentFocusDTO dto) {
        po.setTfId(dto.getId());
//        po.setName(dto.getName());
//        po.setSex(dto.getSex());
//        po.setHometown(dto.getTown());
//        po.setUnitPosition(dto.getUnit());
//        po.setSocialWork(dto.getSocial());
//        if (dto.getType() != 0) {
//            po.setNatureId(dto.getType());
//        }
//        po.setPhone(dto.getPhone());
    }
}
