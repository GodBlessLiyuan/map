package com.talentmap.web.controller;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.TalentFocusDTO;
import com.talentmap.web.service.ITalentFocusService;
import com.talentmap.web.vo.TalentFocusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: xiahui
 * @date: Created in 2020/2/26 16:27
 * @description: 重点乡贤人才
 * @version: 1.0
 */
@RequestMapping("focus")
@RestController
public class TalentFocusController {
    @Autowired
    private ITalentFocusService service;

    /**
     * 查询
     *
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param name
     * @param type
     * @param town
     * @return
     */
    @RequestMapping("query")
    public DTPageInfo<TalentFocusVO> query(HttpSession session,
                                           @RequestParam(value = "draw", defaultValue = "1") int draw,
                                           @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                           @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                           @RequestParam(value = "name") String name,
                                           @RequestParam(value = "type") Byte type,
                                           @RequestParam(value = "town") String town) {

        Map<String, Object> reqData = new HashMap<>(3);
        reqData.put("name", name.replaceAll(" ", ""));
        reqData.put("type", type);
        reqData.put("town", town);
        reqData.put("areaId", session.getAttribute("areaId"));

        return service.query(draw, pageNum, pageSize, reqData);
    }


    /**
     * 新增/编辑
     *
     * @param id
     * @param name
     * @param sex
     * @param town
     * @param unit
     * @param phone
     * @param avatar
     * @param picture
     * @return
     */
    @PostMapping("edit")
    public ResultVO edit(HttpSession session,
                         @RequestParam(value = "id", required = false) Long id,
                         @RequestParam(value = "name") String name,
                         @RequestParam(value = "sex", required = false) Byte sex,
                         @RequestParam(value = "town", required = false) String town,
                         @RequestParam(value = "unit", required = false) String unit,
                         @RequestParam(value = "social", required = false) String social,
                         @RequestParam(value = "type", required = false) Integer type,
                         @RequestParam(value = "phone", required = false) String phone,
                         @RequestParam(value = "avatar", required = false) MultipartFile avatar,
                         @RequestParam(value = "picture", required = false) MultipartFile[] picture,
                         @RequestParam(value = "delIds", required = false) List<Long> delIds,
                         @RequestParam(value = "delAva", required = false) String delAva) {
        TalentFocusDTO dto = new TalentFocusDTO(id, name, sex, town, unit, social, type, phone, avatar, picture, delIds, delAva);

        return service.edit(session, dto);
    }

    /**
     * 批量新增
     *
     * @return
     */
    @PostMapping("batchIns")
    public ResultVO batchInsert(HttpSession session,
                                @RequestParam(value = "file") MultipartFile file) {
        return service.batchInsert(session, file);
    }

    /**
     * 删除
     *
     * @param tfId
     * @return
     */
    @PostMapping("delete")
    public ResultVO delete(HttpSession session,
                           @RequestParam("tfId") Long tfId) {
        return service.delete(session, tfId);
    }

    /**
     * 导出
     *
     * @param name
     * @param type
     * @param town
     * @param res
     */
    @RequestMapping("export")
    public void export(HttpSession session,
                       @RequestParam(value = "name") String name,
                       @RequestParam(value = "type") Byte type,
                       @RequestParam(value = "town") String town,
                       HttpServletResponse res) {
        Map<String, Object> reqData = new HashMap<>(3);
        reqData.put("name", name);
        reqData.put("type", type);
        reqData.put("town", town);

        service.export(session, reqData, res);
    }
}
