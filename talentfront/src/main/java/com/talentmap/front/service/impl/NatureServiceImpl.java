package com.talentmap.front.service.impl;

import com.talentmap.common.mapper.NatureMapper;
import com.talentmap.common.pojo.NaturePO;
import com.talentmap.front.service.INatureService;
import com.talentmap.front.vo.NatureVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author ChenXU
 * @version 1.0
 * @date Created in 2020/03/04 09:16
 * @description 人才地图前端模块
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
