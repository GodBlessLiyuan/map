package com.talentmap.web.service.impl;

import com.github.pagehelper.Page;
import com.talentmap.common.bo.TalentFocusBO;
import com.talentmap.common.mapper.FocusPictureMapper;
import com.talentmap.common.mapper.LogMapper;
import com.talentmap.common.mapper.TalentFocusMapper;
import com.talentmap.common.utils.DTPageInfo;
import com.talentmap.common.utils.PageHelper;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.dto.TalentFocusDTO;
import com.talentmap.web.service.ITalentFocusService;
import com.talentmap.web.vo.TalentFocusVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author: xiahui
 * @date: Created in 2020/2/26 16:28
 * @description: 重点乡贤人才
 * @version: 1.0
 */
@EnableTransactionManagement
@Service
public class TalentFocusServiceImpl implements ITalentFocusService {
    @Resource
    private TalentFocusMapper talentFocusMapper;
    @Resource
    private FocusPictureMapper focusPictureMapper;
    @Resource
    private LogMapper logMapper;

    @Value("${file.rootDir}")
    private String rootDir;
    @Value("${file.projectDir}")
    private String projectDir;
    @Value("${file.pictureDir}")
    private String pictureDir;
    @Value("${file.excelDir}")
    private String excelDir;
    @Value("${file.publicPath}")
    private String publicPath;

    private static final String[] EXCEL_TITLE = {"序号", "姓名", "性别", "人才性质", "籍贯", "单位及职务", "社会兼职", "联系方式"};

    @Override
    public DTPageInfo<TalentFocusVO> query(int draw, int pageNum, int pageSize, Map<String, Object> reqData) {
        Page<TalentFocusBO> page = PageHelper.startPage(pageNum, pageSize);
        List<TalentFocusBO> pos = talentFocusMapper.query(reqData);
        return new DTPageInfo<>(draw, page.getTotal(), TalentFocusVO.convert(pos));
    }

    @Override
    public ResultVO edit(HttpSession session, TalentFocusDTO dto) {
        return null;
    }

    @Override
    public ResultVO batchInsert(HttpSession session, MultipartFile file) {
        return null;
    }

    @Override
    public ResultVO delete(HttpSession session, Long tfId) {
        return null;
    }

    @Override
    public void export(HttpSession session, Map<String, Object> reqData, HttpServletResponse res) {

    }
}
