package com.talentmap.web.service;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.TalentFocusDTO;
import com.talentmap.web.vo.TalentFocusVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author: xiahui
 * @date: Created in 2020/2/26 16:28
 * @description: TODO
 * @version: 1.0
 */
public interface ITalentFocusService {
    /**
     * 查询
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param reqData
     * @return
     */
    DTPageInfo<TalentFocusVO> query(int draw, int pageNum, int pageSize, Map<String, Object> reqData);

    /**
     * 编辑
     *
     * @param session
     * @param dto
     * @return
     */
    ResultVO edit(HttpSession session, TalentFocusDTO dto);

    /**
     * 批量录入
     * @return
     */
    ResultVO batchInsert(HttpSession session, MultipartFile file);

    /**
     * 删除
     *
     * @param session
     * @param tfId
     * @return
     */
    ResultVO delete(HttpSession session, Long tfId);

    /**
     * 导出
     * @param session
     * @param reqData
     * @param res
     */
    void export(HttpSession session, Map<String, Object> reqData, HttpServletResponse res);
}
