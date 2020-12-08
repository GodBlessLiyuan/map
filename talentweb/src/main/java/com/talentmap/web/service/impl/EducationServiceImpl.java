package com.talentmap.web.service.impl;

import com.talentmap.common.mapper.EducationMapper;
import com.talentmap.common.pojo.EducationPO;
import com.talentmap.web.service.IEducationService;
import com.talentmap.web.vo.EducationVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/3/3 11:10
 * @description: TODO
 * @version: 1.0
 */
@Service
public class EducationServiceImpl implements IEducationService {
    @Resource
    private EducationMapper educationMapper;

    @Override
    public List<EducationVO> queryAll() {
        List<EducationPO> pos = educationMapper.queryAll();
        return EducationVO.convert(pos);
    }
}
