package com.talentmap.web.controller;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.TalentGeneralDTO;
import com.talentmap.web.service.ITalentGeneralService;
import com.talentmap.web.vo.TalentGeneralVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 12:58
 * @description 一般乡贤人才
 */
@RequestMapping("general")
@RestController
public class TalentGeneralController {

    @Autowired
    private ITalentGeneralService service;

    /**
     * 地图查询
     *
     * @param session
     * @param china
     * @return
     */
    @PostMapping("queryMap")
    public ResultVO queryMap(HttpSession session, @RequestParam(value = "china", defaultValue = "0", required = false) Byte china) {
        return service.queryMap(session, china);
    }

    /**
     * url: talentmanager/general/query
     * 根据参数查找一般乡贤，单表查询无图片，需要分页，用于后台 乡贤管理
     *
     * @param httpSession
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param name        姓名
     * @param town        原籍地
     * @param location    现所在地
     * @param workUnit    现工作单位
     * @param field       行业领域
     * @param natureId    人才性质
     * @return TalentGeneralVO
     */
    @RequestMapping("query")
    public DTPageInfo<TalentGeneralVO> query(HttpSession httpSession,
                                             @RequestParam(value = "draw", defaultValue = "1") int draw,
                                             @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                             @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                             @RequestParam(value = "name", defaultValue = "") String name,
                                             @RequestParam(value = "location", defaultValue = "") String location,
                                             @RequestParam(value = "workUnit", defaultValue = "") String workUnit,
                                             @RequestParam(value = "field", defaultValue = "") String field,
                                             @RequestParam(value = "natureId", defaultValue = "0") Byte natureId,
                                             @RequestParam(value = "town", defaultValue = "") String town,
                                             @RequestParam(value = "source", defaultValue = "") String sourceName) {

        HashMap<String, Object> hashMap = new HashMap<>(9);
        hashMap.put("name", name);
        hashMap.put("location", location);
        hashMap.put("workUnit", workUnit);
        hashMap.put("field", field);
        hashMap.put("natureId", natureId);
        hashMap.put("town", town);
        hashMap.put("sourceName",sourceName);
        return service.query(httpSession, draw, pageNum, pageSize, hashMap);
    }


    /**
     * 新增/编辑
     *
     * @param id      乡贤ID
     * @param name    名称
     * @param focus   是否重要
     * @param sex     性别
     * @param birth   出生年月
     * @param town    原籍地
     * @param local   所在地区
     * @param educ    学历
     * @param unit    现工作单位
     * @param posi    职务
     * @param social  社会兼职
     * @param field   行业领域
     * @param type    人才性质
     * @param phone   联系方式
     * @param lgtd    经度
     * @param lat     纬度
     * @param contact 邮箱/微信
     * @param school  高中毕业院校
     * @param avatar  乡贤头像
     * @param picture 乡贤其他图片
     * @return
     */
    @PostMapping("edit")
    public ResultVO edit(HttpSession session,
                         @RequestParam(value = "id", required = false) Long id,
                         @RequestParam(value = "name") String name,
                         @RequestParam(value = "focus") Boolean focus,
                         @RequestParam(value = "sex", required = false) Byte sex,
                         @RequestParam(value = "birth", required = false) String birth,
                         @RequestParam(value = "town", required = false) String town,
                         @RequestParam(value = "local", required = false) String local,
                         @RequestParam(value = "educ", required = false) Integer educ,
                         @RequestParam(value = "unit", required = false) String unit,
                         @RequestParam(value = "posi", required = false) String posi,
                         @RequestParam(value = "social", required = false) String social,
                         @RequestParam(value = "field", required = false) String field,
                         @RequestParam(value = "type", required = false) Integer type,
                         @RequestParam(value = "phone", required = false) String phone,
                         @RequestParam(value = "lgtd", required = false) BigDecimal lgtd,
                         @RequestParam(value = "lat", required = false) BigDecimal lat,
                         @RequestParam(value = "contact", required = false) String contact,
                         @RequestParam(value = "school", required = false) String school,
                         @RequestParam(value = "avatar", required = false) MultipartFile avatar,
                         @RequestParam(value = "picture", required = false) MultipartFile[] picture,
                         @RequestParam(value = "delIds", required = false) List<Long> delIds,
                         @RequestParam(value = "delAva", required = false) String delAva) {
        TalentGeneralDTO dto = new TalentGeneralDTO(id, name, focus, sex, birth, town, local, educ, unit, posi, social, field, type, phone, lgtd, lat, contact, school, avatar, picture, delIds, delAva);

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
     * @param tgId
     * @return
     */
    @PostMapping("delete")
    public ResultVO delete(HttpSession session,
                           @RequestParam("tgId") Long tgId) {
        return service.delete(session, tgId);
    }

    /**
     * 导出
     *
     * @param session
     * @param name
     * @param location
     * @param workUnit
     * @param field
     * @param natureId
     * @param town
     * @param res
     */
    @RequestMapping("export")
    public void export(HttpSession session,
                       @RequestParam(value = "name", defaultValue = "") String name,
                       @RequestParam(value = "location", defaultValue = "") String location,
                       @RequestParam(value = "workUnit", defaultValue = "") String workUnit,
                       @RequestParam(value = "field", defaultValue = "") String field,
                       @RequestParam(value = "natureId", defaultValue = "0") Byte natureId,
                       @RequestParam(value = "town", defaultValue = "") String town,
                       HttpServletResponse res) {
        HashMap<String, Object> reqData = new HashMap<>(9);
        reqData.put("name", name);
        reqData.put("location", location);
        reqData.put("workUnit", workUnit);
        reqData.put("field", field);
        reqData.put("natureId", natureId);
        reqData.put("town", town);

        service.export(session, reqData, res);
    }

    /**
     * 是否重要
     */
    @PostMapping("important")
    public ResultVO important(HttpSession session, @RequestParam("tgId") Long tgId, @RequestParam("focus") Boolean focus) {
        return service.important(session, tgId, focus);
    }
}
