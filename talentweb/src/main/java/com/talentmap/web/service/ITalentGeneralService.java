package com.talentmap.web.service;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.TalentGeneralDTO;
import com.talentmap.web.vo.TalentGeneralVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 13:00
 * @description 一般乡贤
 */
public interface ITalentGeneralService {
    /**
     * 查询
     *
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param hashMap
     * @return
     */
    DTPageInfo<TalentGeneralVO> query(HttpSession httpSession, int draw, int pageNum, int pageSize, HashMap<String, Object> hashMap);

    /**
     * 手动插入
     *
     * @param session
     * @param dto
     * @return
     */
    ResultVO edit(HttpSession session, TalentGeneralDTO dto);

    /**
     * 批量插入
     *
     * @return
     */
    ResultVO batchInsert(HttpSession session, MultipartFile file);

    /**
     * 删除
     *
     * @param session
     * @param tgId
     * @return
     */
    ResultVO delete(HttpSession session, Long tgId);

    /**
     * 导出
     *
     * @param session
     * @param reqData
     * @param res
     */
    void export(HttpSession session, HashMap<String, Object> reqData, HttpServletResponse res);

    /**
     * 根据Id查询
     *
     * @param id
     * @return
     */
    ResultVO queryById(HttpSession session, Long id);

    /**
     * 查询首页地图展示数据
     *
     * @return
     */
    ResultVO queryMap(HttpSession session, Byte china);

    /**
     * 是否重要
     *
     * @param session
     * @param tgId
     * @param focus
     */
    ResultVO important(HttpSession session, Long tgId, Boolean focus);
}
