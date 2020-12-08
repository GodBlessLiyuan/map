package com.talentmap.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.talentmap.common.mapper.TalentGeneralMapper;
import com.talentmap.common.pojo.TalentGeneralPO;
import com.talentmap.common.vo.ResultVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/4/7 16:14
 * @description: 更新乡贤所在地
 * @version: 1.0
 */
@RequestMapping("test")
@RestController
public class TestController {
    @Resource
    private TalentGeneralMapper talentGeneralMapper;
    @Value("${config.baidu.ak}")
    private String ak;

    @RequestMapping("updateChina")
    @Scheduled(cron = "${jobs.schedule}")    //每隔10分钟刷新一遍
    public ResultVO updateChina() {
        List<TalentGeneralPO> pos = talentGeneralMapper.queryTest();
        int success = 0;
        for (TalentGeneralPO po : pos) {
            Byte isChina = isChinaByLnglat(po.getLongitude(), po.getLatitude());
            if (null != isChina) {
                po.setChina(isChina);
                success++;
                talentGeneralMapper.updateByPrimaryKey(po);
            }
        }
        return new ResultVO<>(1000, success);
    }

    /**
     * 判断是否是china
     *
     * @param longitude
     * @param latitude
     * @return
     */
    private Byte isChinaByLnglat(BigDecimal longitude, BigDecimal latitude) {
        try {
            if (longitude.compareTo(BigDecimal.valueOf(72)) < 0 || longitude.compareTo(BigDecimal.valueOf(136)) > 0
                    || latitude.compareTo(BigDecimal.valueOf(3)) < 0 || latitude.compareTo(BigDecimal.valueOf(54)) > 0) {
                return 2;
            }

            String location = latitude.toString() + "," + longitude.toString();
            // 通过百度Api查询是否是中国
            RestTemplate template = new RestTemplate();
            String res = template.getForObject("http://api.map.baidu.com/reverse_geocoding/v3/?ak={1}&output=json&location={2}", String.class, ak, location);
            JSONObject json = JSONObject.parseObject(res);
            String country = json.getJSONObject("result").getJSONObject("addressComponent").getString("country");
            if ("中国".equals(country)) {
                return 1;
            } else {
                return 2;
            }
        } catch (Exception e) {
            return null;
        }
    }
}
