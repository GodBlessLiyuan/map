package com.talentmap.front.service;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.front.vo.TalentGeneralVO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * @Author：chenXU
 * @Date: Created in 2020/03/02 15:08
 * @Description: 人才地图前端数据查询
 */
public interface ITalentService {

    /**
     * 查询首页地图展示数据
     *
     * @return
     */
    ResultVO queryMap(HttpSession session, Byte china);

    /**
     * 根据参数查找一般乡贤，单表查询无图片，需要分页，用于前台搜索/人员
     *
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param hashMap
     * @return TalentGeneralVO
     */
    DTPageInfo<TalentGeneralVO> findGeneral(HttpSession httpSession, int draw, int pageNum, int pageSize, HashMap<String, Object> hashMap);

    /**
     * 知名乡贤查找
     * 根据参数查找著名乡贤，单表查询，有分页
     * 前台下方展示的一组8个头
     *
     * @param httpSession
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param hashMap
     * @return
     */
    DTPageInfo<HashMap<String, Object>> findFamous(HttpSession httpSession, int draw, int pageNum,
                                                   int pageSize, HashMap<String, Object> hashMap);


    /**
     * 根据id查询著名人才详情，带轮播图picture
     *
     * @param tfId
     * @return
     */
    HashMap<String, Object> famousDetail(Long tfId);

    DTPageInfo<TalentGeneralVO> findGeneralOnlyByName(HttpSession httpSession, int draw, int pageNum, int pageSize, HashMap<String, Object> hashMap,int selectType);
}
