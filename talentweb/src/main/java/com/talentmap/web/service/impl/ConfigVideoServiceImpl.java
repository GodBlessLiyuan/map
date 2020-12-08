package com.talentmap.web.service.impl;

import com.talentmap.common.constant.ModuleConstant;
import com.talentmap.common.mapper.LogMapper;
import com.talentmap.common.mapper.VideoMapper;
import com.talentmap.common.pojo.VideoPO;
import com.talentmap.common.utils.FileUtil;
import com.talentmap.common.utils.LogUtil;
import com.talentmap.common.vo.ResultVO;
import com.talentmap.web.service.IConfigVideoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @Author：dangyi
 * @Date: Created in 2020/3/4 10:44
 * @Description:
 */
@Service
public class ConfigVideoServiceImpl implements IConfigVideoService {
    private final static Logger logger = LoggerFactory.getLogger(ConfigVideoServiceImpl.class);
    @Resource
    private VideoMapper videoMapper;
    @Resource
    private LogMapper logMapper;

    @Value("${file.rootDir}")
    private String rootDir;
    @Value("${file.projectDir}")
    private String projectDir;
    @Value("${file.videoDir}")
    private String videoDir;
    @Value("${file.publicPath}")
    private String publicPath;

    /**
     * 查看视频
     */
    @Override
    public ResultVO queryVideo() {
        VideoPO po = videoMapper.queryVideo();
        if (po == null || po.getUrl() == null) {
            return new ResultVO(1001, "尚未配置视频");
        }

        //拼接视频路径
        String url = publicPath + po.getUrl();
        return new ResultVO(1000, url);
    }

    /**
     * 编辑视频
     */
    @Override
    public ResultVO editVideo(HttpSession session, MultipartFile file) {

        //判空
        if (file == null) {
            return new ResultVO(1006, "上传视频不能为空");
        }

        VideoPO videoPO = videoMapper.queryVideo();

        //t_video
        int result1;
        if (videoPO == null) {
            //上传视频
            videoPO = new VideoPO();
            videoPO.setUrl(FileUtil.uploadFile(file, rootDir, projectDir, videoDir, ModuleConstant.VIDEO));
            videoPO.setUpdateTime(new Date());
            result1 = videoMapper.insert(videoPO);
        } else {
            //更新视频
            videoPO.setUrl(FileUtil.uploadFile(file, rootDir, projectDir, videoDir, ModuleConstant.VIDEO));
            videoPO.setUpdateTime(new Date());
            result1 = videoMapper.updateByPrimaryKey(videoPO);
        }
        if (result1 == 0) {
            LogUtil.log(logger, "editVideo", "编辑视频失败", videoPO);
        }

        //t_log：插入数据，记录用户操作行为
        String description;
        if (videoPO == null) {
            description = "增加了 视频配置模块的视频";
        } else {
            description = "修改了 视频配置模块的视频";
        }
        int result2 = LogUtil.recordUserOperation(session, description, logMapper);
        if (result2 == 0) {
            LogUtil.log(logger, "editVideo", "记录操作日志失败");
        }

        return new ResultVO(1000);
    }
}
