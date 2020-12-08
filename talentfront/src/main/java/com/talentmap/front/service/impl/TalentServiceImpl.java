package com.talentmap.front.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.talentmap.common.bo.TalentGeneralBO;
import com.talentmap.common.mapper.NatureMapper;
import com.talentmap.common.mapper.TagMapper;
import com.talentmap.common.mapper.TalentFamousMapper;
import com.talentmap.common.mapper.TalentGeneralMapper;
import com.talentmap.common.pojo.IsolationPO;
import com.talentmap.common.pojo.NaturePO;
import com.talentmap.common.pojo.TagPO;
import com.talentmap.common.pojo.TalentGeneralPO;
import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.utils.PageHelper;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.common.vo.TalentMapVO;
import com.talentmap.front.service.ITalentService;
import com.talentmap.front.vo.TalentGeneralVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @Author：chenXU
 * @Date: Created in 2020/03/02 15:08
 * @Description: 人才地图前端数据查询
 */
@Service
public class TalentServiceImpl implements ITalentService {
    @Autowired
    private TalentGeneralMapper talentGeneralMapper;
    @Autowired
    private NatureMapper natureMapper;
    @Value("${file.publicPath}")
    private String publicPath;
    @Autowired
    private TagMapper tagMapper;
    @Autowired
    private TalentFamousMapper talentFamousMapper;
    @Autowired
    private StringRedisTemplate template;

    @Override
    public DTPageInfo<TalentGeneralVO> findGeneral(HttpSession httpSession, int draw, int pageNum, int pageSize, HashMap<String, Object> hashMap) {
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
//        学校，工会
        if (isolationPO.getTagId() != null) {
            hashMap.put("isolationType", 2);
            TagPO tagPO = tagMapper.selectByPrimaryKey(isolationPO.getTagId());
            hashMap.put("tagName", tagPO.getName());
//         区级，乡镇级
        } else if (isolationPO.getIsolationId() >= 2) {
            hashMap.put("isolationType", 1);
//         市级
        } else {
            hashMap.put("isolationType", 0);
        }
        Page<TalentGeneralBO> page = PageHelper.startPage(pageNum, pageSize);
        List<TalentGeneralBO> bos = talentGeneralMapper.findGeneral(hashMap);
        return new DTPageInfo<>(draw, page.getTotal(), TalentGeneralVO.convert(bos));
    }


    @Override
    public DTPageInfo<HashMap<String, Object>> findFamous(HttpSession httpSession, int draw, int pageNum,
                                                          int pageSize, HashMap<String, Object> hashMap) {
        Page<TalentGeneralBO> page = PageHelper.startPage(pageNum, pageSize);
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
        List<HashMap<String, Object>> list = talentFamousMapper.findFamous(hashMap);

        for (HashMap<String, Object> map : list) {
            if (map.get("avatar") != null) {
                String newPublicPath = publicPath + map.get("avatar");
                map.put("avatar", newPublicPath);
            } else {
                map.put("avatar", null);
            }
        }
        return new DTPageInfo<>(draw, page.getTotal(), list);
    }

    @Override
    public HashMap<String, Object> famousDetail(Long tfsId) {
        //用tfsId从famous表里取得知名乡贤信息
        HashMap<String, Object> hashMap = talentFamousMapper.findOne(tfsId);
        //给头像增加publicPath
        String newAvatarPath;

        if (hashMap != null && (String) hashMap.get("avatar") != null) {
            newAvatarPath = publicPath + (String) hashMap.get("avatar");
        } else {
            newAvatarPath = null;
        }
        hashMap.put("avatar", newAvatarPath);
        //用tfsId从famous表关联查询得到轮播图的url
        List<String> list = talentFamousMapper.findPics(tfsId);
        //加public path
        ArrayList<String> pictureList = new ArrayList<>();
        for (String pic : list) {
            if (pic != null) {
                pictureList.add(publicPath + pic);
            }
        }
        hashMap.put("pics", pictureList);
        return hashMap;
    }

    @Override
    public DTPageInfo<TalentGeneralVO> findGeneralOnlyByName(HttpSession httpSession, int draw, int pageNum, int pageSize, HashMap<String, Object> hashMap,int selectType) {
        //从session里取得隔离信息
        IsolationPO isolationPO = (IsolationPO) httpSession.getAttribute("isolationPO");
        hashMap.put("isolationId", isolationPO.getIsolationId());
//        学校，工会
        if (isolationPO.getTagId() != null) {
            hashMap.put("isolationType", 2);
            TagPO tagPO = tagMapper.selectByPrimaryKey(isolationPO.getTagId());
            hashMap.put("tagName", tagPO.getName());
//         区级，乡镇级
        } else if (isolationPO.getIsolationId() >= 2) {
            hashMap.put("isolationType", 1);
//         市级
        } else {
            hashMap.put("isolationType", 0);
        }
        Page<TalentGeneralBO> page = PageHelper.startPage(pageNum, pageSize);
        List<TalentGeneralBO> bos = null;
        if(selectType==0)
        {
            bos = talentGeneralMapper.findGeneral(hashMap);//查name
            if(bos==null||bos.size()==0)
            {
                hashMap.put("workUnit",hashMap.get("name"));
                hashMap.remove("name");
                bos = talentGeneralMapper.findGeneral(hashMap);
                if(bos==null||bos.size()==0)
                {
                    hashMap.put("town",hashMap.get("workUnit"));
                    hashMap.remove("workUnit");
                    bos = talentGeneralMapper.findGeneral(hashMap);
                    if(bos==null||bos.size()==0)
                    {
                        hashMap.put("location",hashMap.get("town"));
                        hashMap.remove("town");
                        bos = talentGeneralMapper.findGeneral(hashMap);
                        selectType = 4;
                    }
                    else {
                        selectType = 3;
                    }
                }
                else {
                    selectType = 2;
                }
            }
            else {
                selectType = 1;
            }

        }
        else if(selectType==1){
            bos = talentGeneralMapper.findGeneral(hashMap);//查name
        }
        else if(selectType==2){
            hashMap.put("workUnit",hashMap.get("name"));
            hashMap.remove("name");
            bos = talentGeneralMapper.findGeneral(hashMap);
        }
        else if(selectType==3){
            hashMap.put("town",hashMap.get("workUnit"));
            hashMap.remove("workUnit");
            bos = talentGeneralMapper.findGeneral(hashMap);
        }
        else if(selectType==4){
            hashMap.put("location",hashMap.get("town"));
            hashMap.remove("town");
            bos = talentGeneralMapper.findGeneral(hashMap);
        }

        return new DTPageInfo<>(draw, page.getTotal(), TalentGeneralVO.convert(bos), selectType);
    }

    @Override
    public ResultVO queryMap(HttpSession session, Byte china) {
        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        String redisKey = "TalentMap_" + isolationPO.getIsolationId() + "_" + china;
        if (template.hasKey(redisKey)) {
            TalentMapVO vo = JSON.parseObject(template.opsForValue().get(redisKey), TalentMapVO.class);
            return new ResultVO<>(1000, vo);
        }
        List<TalentGeneralPO> pos = talentGeneralMapper.queryByChinaAndIsoId(china, isolationPO.getIsolationId());

        TalentMapVO vo = new TalentMapVO();

        List<NaturePO> naturePOs = natureMapper.queryAll();
        List<String> types = new ArrayList<>();
        Map<Integer, String> natureMap = new HashMap<>();
        for (NaturePO po : naturePOs) {
            types.add(po.getName());
            natureMap.put(po.getNatureId(), po.getName());
        }
        vo.setTypes(types);

        List<TalentMapVO.Detail> details = new ArrayList<>();
        for (TalentGeneralPO po : pos) {
            TalentMapVO.Detail detail = vo.new Detail();
            detail.setName(po.getName());

            List<Object> values = new ArrayList<>();
            values.add(po.getLongitude());
            values.add(po.getLatitude());
            TalentMapVO.Value value = vo.new Value();
            value.setPosi(po.getPosition());
            value.setType(natureMap.get(po.getNatureId()));
            value.setLocal(po.getLocation());
            value.setTown(po.getHometown());
            value.setUnit(po.getWorkunit());
            value.setPhone(po.getPhone());
            values.add(value);

            detail.setValue(values);

            details.add(detail);
        }
        vo.setDetails(details);

        template.opsForValue().set(redisKey, JSON.toJSONString(vo), 5L, TimeUnit.MINUTES);
        return new ResultVO<>(1000, vo);
    }


}
