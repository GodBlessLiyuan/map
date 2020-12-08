package com.talentmap.common.utils;

import com.alibaba.fastjson.JSON;
import com.talentmap.common.mapper.LogMapper;
import com.talentmap.common.pojo.IsolationPO;
import com.talentmap.common.pojo.LogPO;
import org.slf4j.Logger;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: dangyi
 * @date: Created in 18:38 2019/12/21
 * @version: 1.0.0
 * @description:
 */
@Component
public class LogUtil {

    /**
     * 针对于逻辑错误，当条件触发时，调用该方法打印日志
     */
    public static void log(Logger logger, String methodName, String description, Object... params) {
        String current_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        logger.error("逻辑错误：time={}, methodName = {}, description = {}, parameters = {}", current_date, methodName, description, JSON.toJSONString(params));
    }

    /**
     * 日志：记录用户操作行为
     */
    public static int recordUserOperation(HttpSession session, String description, LogMapper logMapper, String... url) {
        LogPO logPO = new LogPO();
        long userId = (long) session.getAttribute("userId");
        logPO.setUserId(userId);
        logPO.setDescription(description);
        if (null != url && url.length != 0) {
            logPO.setUrl(url[0]);
        }
        logPO.setCreateTime(new Date());
        IsolationPO isolationPO = (IsolationPO) session.getAttribute("isolationPO");
        logPO.setIsolationId(isolationPO.getIsolationId());
        int result = logMapper.insert(logPO);
        return result;
    }
}
