package com.talentmap.common.vo;

import lombok.Data;

import java.util.List;

/**
 * @author: xiahui
 * @date: Created in 2020/3/4 14:21
 * @description: 人才地图数据
 * @version: 1.0
 */
@Data
public class TalentMapVO {
    /**
     * 人才类型集合
     */
    private List<String> types;
    private List<Detail> details;

    @Data
    public class Detail {
        /**
         * 姓名
         */
        private String name;
        private List value;
    }

    @Data
    public class Value {
        /**
         * 职务
         */
        private String posi;
        /**
         * 人才性质
         */
        private String type;
        /**
         * 现居地
         */
        private String local;
        /**
         * 原籍地
         */
        private String town;
        /**
         * 工作单位
         */
        private String unit;
        /**
         * 联系方式
         */
        private String phone;
    }
}
