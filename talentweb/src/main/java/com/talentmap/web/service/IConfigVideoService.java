package com.talentmap.web.service;

import com.talentmap.common.vo.ResultVO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

/**
 * @Author：dangyi
 * @Date: Created in 2020/3/4 10:43
 * @Description:
 */
public interface IConfigVideoService {
    ResultVO queryVideo();

    ResultVO editVideo(HttpSession session, MultipartFile file);
}
