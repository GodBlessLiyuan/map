package com.talentmap.front.controller;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.front.service.ITalentService;
import com.talentmap.front.vo.TalentGeneralVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * @Author：chenXU
 * @Date: Created in 2020/03/02 15:08
 * @Description: 人才地图前端数据查询
 */
@RestController
@RequestMapping(value = "talentInfo")
public class TalentController {
    @Autowired
    private ITalentService iTalentService;

    @PostMapping("queryMap")
    public ResultVO queryMap(HttpSession session, @RequestParam(value = "china", defaultValue = "0", required = false) Byte china) {
        return iTalentService.queryMap(session, china);
    }

    /**
     * 根据参数查找一般乡贤，单表查询无图片，需要分页，用于前台搜索/人员
     * url：talentfront/talentInfo/findGeneral
     *
     * @param httpSession
     * @param draw
     * @param pageNum     开始页码
     * @param pageSize    每页数量
     * @param name        姓名
     * @param location    现居地址
     * @param workUnit    现工作单位
     * @param field       行业领域
     * @param natureId    人才性质
     * @return TalentGeneralVO
     */
    @RequestMapping("findGeneral")
    public DTPageInfo<TalentGeneralVO> findGeneral(HttpSession httpSession,
                                                   @RequestParam(value = "draw", defaultValue = "1") int draw,
                                                   @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                                   @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                                   @RequestParam(value = "name", defaultValue = "") String name,
                                                   @RequestParam(value = "location", defaultValue = "") String location,
                                                   @RequestParam(value = "workUnit", defaultValue = "") String workUnit,
                                                   @RequestParam(value = "field", defaultValue = "") String field,
                                                   @RequestParam(value = "natureId", defaultValue = "0") Byte natureId,
                                                   @RequestParam(value = "town", defaultValue = "") String town) {


        HashMap<String, Object> hashMap = new HashMap<>(7);
        hashMap.put("name", name);
        hashMap.put("location", location);
        hashMap.put("workUnit", workUnit);
        hashMap.put("field", field);
        hashMap.put("natureId", natureId);
        hashMap.put("town", town);
        return iTalentService.findGeneral(httpSession, draw, pageNum, pageSize, hashMap);
    }

    // 手机端每页查询6条数据
    @RequestMapping("findGeneralMobile")
    public DTPageInfo<TalentGeneralVO> findGeneralMobile(HttpSession httpSession,
                                                   @RequestParam(value = "draw", defaultValue = "1") int draw,
                                                   @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                                   @RequestParam(value = "length", defaultValue = "500") int pageSize,
                                                   @RequestParam(value = "name", defaultValue = "") String name,
                                                   @RequestParam(value = "location", defaultValue = "") String location,
                                                   @RequestParam(value = "workUnit", defaultValue = "") String workUnit,
                                                   @RequestParam(value = "field", defaultValue = "") String field,
                                                   @RequestParam(value = "natureId", defaultValue = "0") Byte natureId,
                                                   @RequestParam(value = "town", defaultValue = "") String town) {


        HashMap<String, Object> hashMap = new HashMap<>(7);
        hashMap.put("name", name);
        hashMap.put("location", location);
        hashMap.put("workUnit", workUnit);
        hashMap.put("field", field);
        hashMap.put("natureId", natureId);
        hashMap.put("town", town);
        pageNum = draw*5;
        return iTalentService.findGeneral(httpSession, draw, pageNum, pageSize, hashMap);
    }

    /**
     * 根据参数查找一般乡贤，单表查询无图片，需要分页，用于前台搜索/人员
     * url：talentfront/talentInfo/findGeneralMobileOnlyByName
     *
     * @param httpSession
     * @param draw
     * @param pageNum     开始页码
     * @param pageSize    每页数量
     * @param name        可输入姓名/工作单位、原籍地、现居地
     * @param natureId    人才性质
     * @return TalentGeneralVO
     * */
    @RequestMapping("findGeneralMobileOnlyByName")
    public DTPageInfo<TalentGeneralVO> findGeneralMobileOnlyByName(HttpSession httpSession,
                                                         @RequestParam(value = "draw", defaultValue = "1") int draw,
                                                         @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                                         @RequestParam(value = "length", defaultValue = "10") int pageSize,
                                                         @RequestParam(value = "name", defaultValue = "") String name,
                                                         @RequestParam(value = "natureId", defaultValue = "0") Byte natureId,
                                                                   @RequestParam(value = "selectType", defaultValue = "0") int selectType) {


        HashMap<String, Object> hashMap = new HashMap<>(7);
        hashMap.put("name", name);
        hashMap.put("natureId", natureId);
        pageNum = draw*10;
//        if(draw==0){
//            draw=1;
//        }
        return iTalentService.findGeneralOnlyByName(httpSession, draw, pageNum, pageSize, hashMap,selectType);
    }

    /**
     * 根据参数查找知名乡贤，单表查询，按照famous表的num排序，有分页
     * 前台下方展示的一组8个头
     * url: talentmanager/talentInfo/findFamous
     *
     * @param httpSession
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param name        姓名
     * @param type        人才性质
     * @param ava         有无头像
     * @return
     */
    @RequestMapping("findFamous")
    public DTPageInfo<HashMap<String, Object>> findFamous(HttpSession httpSession,
                                                          @RequestParam(value = "draw", defaultValue = "1") int draw,
                                                          @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                                          @RequestParam(value = "length", defaultValue = "1000") int pageSize,
                                                          @RequestParam(value = "name", defaultValue = "") String name,
                                                          @RequestParam(value = "type", defaultValue = "0") Byte type,
                                                          @RequestParam(value = "ava", defaultValue = "0") Byte ava) {

        HashMap<String, Object> hashMap = new HashMap<>(6);
        hashMap.put("name", name);
        hashMap.put("type", type);
        hashMap.put("ava", ava);
        return iTalentService.findFamous(httpSession, draw, pageNum, pageSize, hashMap);
    }



    /**
     * 著名乡贤详情页面：轮播图页
     */
    @RequestMapping("famousDetail")
    public ResultVO famousDetail(@RequestParam(value = "tfId")Long tfsId){
        return new ResultVO<>(1000, iTalentService.famousDetail(tfsId));
    }

}
