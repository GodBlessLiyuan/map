package com.talentmap.web.utils;

import java.util.Map;

/**
 * @author: xiahui
 * @date: Created in 2020/3/3 15:24
 * @description: 区域工具
 * @version: 1.0
 */
public class AreaUtil {

    /**
     * 根据家乡匹配出区域ID
     *
     * @param hometown
     * @return
     */
    public static Long getAreaId(String hometown) {
        if (null == hometown || "".equals(hometown)) {
            return null;
        }

        for (Map.Entry<String, Long> entry : TalentUtil.areaMap.entrySet()) {
            if (hometown.contains(entry.getKey())) {
                return entry.getValue();
            }
        }

        return null;
    }
}
