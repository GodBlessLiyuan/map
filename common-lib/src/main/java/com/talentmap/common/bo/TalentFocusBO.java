package com.talentmap.common.bo;

import com.talentmap.common.pojo.FocusPicturePO;
import com.talentmap.common.pojo.TalentFocusPO;
import lombok.Data;

import java.util.List;

/**
 * @Author：chenXU
 * @Date: Created in 2020/03/02 15:08
 * @Description: 重点人才+对应的照片list
 */
@Data
public class TalentFocusBO extends TalentFocusPO {
    private String nature;

    List<FocusPicturePO> pics;
}
