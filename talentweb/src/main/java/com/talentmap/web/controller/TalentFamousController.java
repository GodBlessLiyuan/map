package com.talentmap.web.controller;

import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.service.ITalentFamousService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @author: ChenXU
 * @date: Created in 2020/4/02 20:14
 * @description: 展示配置
 * @version: 2.0
 */
@RequestMapping("famous")
@RestController
public class TalentFamousController {
    @Autowired
    private ITalentFamousService iTalentFamousService;

    /**
     * 知名乡贤查找
     * 后台：展示配置
     * url: talentmanager/famous/query
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
    @RequestMapping("query")
    public DTPageInfo<HashMap<String, Object>> findFamous(HttpSession httpSession,
                                                          @RequestParam(value = "draw", defaultValue = "1") int draw,
                                                          @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                                          @RequestParam(value = "length", defaultValue = "1000") int pageSize,
                                                          @RequestParam(value = "name", defaultValue = "") String name,
                                                          @RequestParam(value = "unit", defaultValue = "") String unit,
                                                          @RequestParam(value = "type", defaultValue = "0") Byte type,
                                                          @RequestParam(value = "ava", defaultValue = "0") Byte ava,
                                                          @RequestParam(value = "town", defaultValue = "") String town) {
        pageSize = 1000;
        HashMap<String, Object> hashMap = new HashMap<>(8);
        hashMap.put("name", name);
        hashMap.put("unit", unit);
        hashMap.put("type", type);
        hashMap.put("ava", ava);
        hashMap.put("town", town);
        return iTalentFamousService.findFamous(httpSession, draw, pageNum, pageSize, hashMap);
    }


    /**
     * 重点乡贤查找
     * 后台：展示配置
     * url: talentmanager/famous/queryFocus
     *
     * @param httpSession
     * @param draw
     * @param pageNum
     * @param pageSize
     * @param name        姓名
     * @param town        原籍地
     * @param location    现所在地
     * @param unit        工作单位
     * @param field       行业领域
     * @param type        人才性质
     * @param ava         有无头像
     * @return
     */
    @RequestMapping("queryFocus")
    public DTPageInfo<HashMap<String, Object>> findFocus(HttpSession httpSession,
                                                         @RequestParam(value = "draw", defaultValue = "1") int draw,
                                                         @RequestParam(value = "start", defaultValue = "1") int pageNum,
                                                         @RequestParam(value = "length", defaultValue = "100") int pageSize,
                                                         @RequestParam(value = "name", defaultValue = "") String name,
                                                         @RequestParam(value = "town", defaultValue = "") String town,
                                                         @RequestParam(value = "location", defaultValue = "") String location,
                                                         @RequestParam(value = "unit", defaultValue = "") String unit,
                                                         @RequestParam(value = "field", defaultValue = "") String field,
                                                         @RequestParam(value = "type", defaultValue = "0") Byte type,
                                                         @RequestParam(value = "ava", defaultValue = "0") Byte ava) {

        HashMap<String, Object> hashMap = new HashMap<>(10);
        hashMap.put("name", name);
        hashMap.put("hometown", town);
        hashMap.put("location", location);
        hashMap.put("unit", unit);
        hashMap.put("field", field);
        hashMap.put("type", type);
        hashMap.put("ava", ava);
        return iTalentFamousService.findFocus(httpSession, draw, pageNum, pageSize, hashMap);
    }


    /**
     * 知名乡贤添加
     * 展示配置
     * url: talentmanager/famous/addFamous
     *
     * @param httpSession
     * @param tfIdList
     * @return 1000, Integer resultNum(内容为成功添加的数量)
     */
    @PostMapping("addFamous")
    public ResultVO addFamous(HttpSession httpSession, @RequestParam("tfIds[]") List<Long> tfIdList) {
//      public ResultVO addFamous(HttpSession httpSession) {
//        ArrayList<Long> tfIdList = new ArrayList<>();
//        tfIdList.add((long)152);
//        tfIdList.add((long)153);
        return iTalentFamousService.addFamous(httpSession, tfIdList);
    }

    /**
     * 知名乡贤删除
     * 展示配置
     * url: talentmanager/famous/deleteFamous
     * @param httpSession
     * @param tfsId
     * @return 1000, Integer resultNum(内容为成功删除的数量)
     */
    @PostMapping("deleteFamous")
    public ResultVO deleteFamous(HttpSession httpSession, @RequestParam Long tfsId) {
        return iTalentFamousService.deleteFamous(httpSession, tfsId);
    }


    /**
     * 拖拽排序
     *
     * @param tfsIds
     * @return
     */
    @PostMapping("updateNum")
    public ResultVO status(HttpSession session,
                           @RequestParam("tfIds[]") List<Long> tfsIds) {
        return iTalentFamousService.updateNum(session, tfsIds);
    }

}
