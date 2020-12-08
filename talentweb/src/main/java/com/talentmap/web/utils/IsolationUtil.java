package com.talentmap.web.utils;

import com.talentmap.common.mapper.IsolationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author: xiahui
 * @date: Created in 2020/3/30 10:58
 * @description: 隔离工具
 * @version: 1.0
 */
@Component
public class IsolationUtil {
    @Autowired
    private IsolationMapper isolationMapper;
}
