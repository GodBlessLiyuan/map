package com.talentmap.common.mapper;

import com.talentmap.common.bo.TalentGeneralBO;
import com.talentmap.common.pojo.TalentGeneralPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

/**
 * TalentGeneralMapper继承基类
 */
@Mapper
public interface TalentGeneralMapper extends BaseMapper<TalentGeneralPO, Long> {
    /**
     * 批量插入
     *
     * @param pos
     */
    void batchInsert(List<TalentGeneralPO> pos);


    /**
     * 根据 china 和 isolationId 查询所有数据
     *
     * @param china
     * @param isolationId
     * @return
     */
    List<TalentGeneralPO> queryByChinaAndIsoId(@Param("china") Byte china, @Param("isolationId") Long isolationId);


    /**
     * 根据Id查询
     *
     * @param tgId
     * @return
     */
    TalentGeneralBO queryById(Long tgId);


    /**
     * 根据籍贯 和 隔离字段查询
     *
     * @param name
     * @param isolationId
     * @return
     */
    List<TalentGeneralPO> queryByNameAndIso(@Param("name") String name, @Param("isolationId") Long isolationId);

    /**
     * 后台 展示配置-乡贤管理
     * 一般乡贤查找
     * @param hashMap
     * @return
     */

    /**
     * 后台 展示配置-乡贤管理
     * 一般乡贤查找
     *
     * @param hashMap
     * @return
     */
    List<TalentGeneralBO> findGeneral(HashMap<String, Object> hashMap);

    /**
     * 统一更新乡贤人才china字段
     */
    List<TalentGeneralPO> queryTest();
}