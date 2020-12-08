package com.talentmap.web.dto;

import com.talentmap.common.pojo.TalentGeneralPO;
import com.talentmap.common.utils.DateUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 13:02
 * @description
 */
@Data
@AllArgsConstructor
public class TalentGeneralDTO implements Serializable {
    public static final long SerialVersionUID = 1L;

    private Long id;
    private String name;
    private Boolean focus;
    private Byte sex;
    private String birth;
    private String town;
    private String local;
    private Integer educ;
    private String unit;
    private String posi;
    private String social;
    private String field;
    private Integer type;
    private String phone;
    private BigDecimal lgtd;
    private BigDecimal lat;
    private String contact;
    private String school;
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
    public static TalentGeneralPO convert2PO(TalentGeneralDTO dto) {
        TalentGeneralPO po = new TalentGeneralPO();
        TalentGeneralDTO.updatePOByDTO(po, dto);
        return po;
    }

    /**
     * 根据dto 更新 po
     *
     * @param po
     * @param dto
     */
    public static void updatePOByDTO(TalentGeneralPO po, TalentGeneralDTO dto) {
        po.setTgId(dto.getId());
        po.setName(dto.getName());
        po.setSex(dto.getSex());
        try {
            po.setBirth(DateUtil.str2Date(dto.getBirth(), DateUtil.YM));
        }catch (Exception e){
            e.printStackTrace();
        }
        po.setHometown(dto.getTown());
        po.setLocation(dto.getLocal());
        if (dto.getEduc() != 0) {
            po.setEducId(dto.getEduc());
        }
        po.setWorkunit(dto.getUnit());
        po.setSocialWork(dto.getSocial());
        po.setPosition(dto.getPosi());
        po.setField(dto.getField());
        if (dto.getType() != 0) {
            po.setNatureId(dto.getType());
        }
        po.setPhone(dto.getPhone());
        po.setLongitude(dto.getLgtd());
        po.setLatitude(dto.getLat());
        po.setContact(dto.getContact());
        po.setHighSchool(dto.getSchool());
    }
}
