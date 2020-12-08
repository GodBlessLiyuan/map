package com.talentmap.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.TimeZone;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/12 10:56
 * @description 人才地图
 */
@MapperScan("com.talentmap.common.mapper")
@SpringBootApplication
@EnableScheduling
@EnableDiscoveryClient
public class  WebApplication {
    public static void main(String[] args) {
        TimeZone time = TimeZone.getTimeZone("Asia/Shanghai");
        TimeZone.setDefault(time);
        SpringApplication.run(WebApplication.class, args);
    }
}
