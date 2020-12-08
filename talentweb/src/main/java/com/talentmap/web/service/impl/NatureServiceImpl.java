package com.talentmap.web.service.impl;

import com.talentmap.common.mapper.NatureMapper;
import com.talentmap.common.pojo.NaturePO;
import com.talentmap.web.service.INatureService;
import com.talentmap.web.vo.NatureVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/2/28 17:10
 * @description: TODO
 * @version: 1.0
 */
@Service
public class NatureServiceImpl implements INatureService {
    @Resource
    private NatureMapper natureMapper;

    @Override
    public List<NatureVO> queryAll() {
        List<NaturePO> pos = natureMapper.queryAll();
        return NatureVO.convert(pos);
    }
}
