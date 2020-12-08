package com.talentmap.common.mapper;

import com.talentmap.common.pojo.TalentFamousPO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

/**
 * TalentFamousMapper继承基类
 */
@Mapper
public interface TalentFamousMapper extends BaseMapper<TalentFamousPO, Long> {



    /**
     * 批量更新
     *
     * @param pos
     */
    void batchUpdate(List<TalentFamousPO> pos);

    /**
     * 根据Ids查询数据
     *
     * @param tfIds
     * @return
     */
    List<TalentFamousPO> queryByIds(List<Long> tfIds);


    /**
     * 根据一般乡贤ID删除数据
     *
     * @param tgId
     */
    void deleteByTgId(Long tgId);

    /**
     * 根据重点乡贤ID删除数据
     *
     * @param tfId
     */
    void deleteByTfId(Long tfId);

    /**
     * 著名乡贤查找
     * 前台：下面八个头
     * 后台：展示配置
     * @param hashMap
     * @return
     */
    List<HashMap<String, Object>> findFamous(HashMap<String, Object>hashMap);

    List<TalentFamousPO> findByNum();

    /**
     * 根据隔离id计算当前知名乡贤数量
     * 用于展示配置 知名乡贤排序
     * @param isolationId
     * @return
     */
    Integer countNum(Long isolationId);

    /**
     * 根据隔离id找相关的知名乡贤
     * 用于展示配置 知名乡贤排序
     * @param isolationId
     * @return
     */
    List<TalentFamousPO> findByIsolationId(@RequestParam(value="isolationId") Long isolationId);


    /**
     * 根据tfsId找具体的
     * 前台八个头点进去，看detail
     * @param tfsId
     * @return
     */
    HashMap<String, Object> findOne(@RequestParam(value="tfsId") Long tfsId);

    /**
     * 根据tfsId找对应的轮播图url
     * 前台八个头点进去，看detail的轮播图url
     * @param tfsId
     * @return
     */
    List<String> findPics(@RequestParam(value="tfsId") Long tfsId);
}