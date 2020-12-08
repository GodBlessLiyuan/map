package com.talentmap.web.service;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/2/27 18:59
 * @description: 展示配置
 * @version: 1.0
 */
public interface ITalentFamousService {

    /**
     * 知名乡贤查找
     * 后台：展示配置
     * @param httpSession
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param hashMap
     * @return
     */
    DTPageInfo<HashMap<String, Object>> findFamous(HttpSession httpSession, int draw, int pageNum,
                                          int pageSize, HashMap<String, Object> hashMap);


    DTPageInfo<HashMap<String, Object>> findFocus(HttpSession httpSession, int draw, int pageNum,
                                                   int pageSize, HashMap<String, Object> hashMap);


    ResultVO addFamous(HttpSession httpSession, List<Long> tfIdList);

    ResultVO deleteFamous(HttpSession session, Long tfsId);
    /**
     * 拖拽排序
     *
     * @param session
     * @param tfsIds
     * @return
     */
    ResultVO updateNum(HttpSession session, List<Long> tfsIds);
}
