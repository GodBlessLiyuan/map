package com.talentmap.common.bo;

import com.talentmap.common.pojo.GeneralPicturePO;
import com.talentmap.common.pojo.TalentGeneralPO;
import lombok.Data;

import java.util.List;

/**
 * @Author：chenXU
 * @Date: Created in 2020/03/02 15:08
 * @Description: 一般人才+对应的照片list
 */
@Data
public class TalentGeneralBO extends TalentGeneralPO {
    private String educ;
    private String nature;
    private String dataSource;
    private Long focus;
    List<GeneralPicturePO> pics;
}
