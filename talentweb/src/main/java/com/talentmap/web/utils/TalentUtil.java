package com.talentmap.web.utils;

import com.talentmap.common.mapper.AreaMapper;
import com.talentmap.common.mapper.EducationMapper;
import com.talentmap.common.mapper.NatureMapper;
import com.talentmap.common.pojo.AreaPO;
import com.talentmap.common.pojo.EducationPO;
import com.talentmap.common.pojo.NaturePO;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: xiahui
 * @date: Created in 2020/3/12 15:24
 * @description: 乡贤工具
 * @version: 1.0
 */
@Component
public class TalentUtil {
    @Resource
    private EducationMapper educationMapper;
    @Resource
    private NatureMapper natureMapper;
    @Resource
    private AreaMapper areaMapper;

    public static Map<String, Integer> natureMap = new HashMap<>();   // 人才性质
    public static Map<String, Integer> educMap = new HashMap<>(); // 学历
    public static Map<String, Long> areaMap = new HashMap<>(); // 区域
    public static Map<Integer, String> natureISMap = new HashMap<>(); // 人才性质

    @PostConstruct
    public void setStatic() {
        for (NaturePO po : natureMapper.queryAll()) {
            natureMap.put(po.getName(), po.getNatureId());
            natureISMap.put(po.getNatureId(), po.getName());
        }
        for (EducationPO po : educationMapper.queryAll()) {
            educMap.put(po.getName(), po.getEducId());
        }
        for (AreaPO po : areaMapper.queryAll()) {
            areaMap.put(po.getName(), po.getAreaId());
        }
    }
}
