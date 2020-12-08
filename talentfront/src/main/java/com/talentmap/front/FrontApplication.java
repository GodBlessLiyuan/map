package com.talentmap.front;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author xiahui
 * @version 1.0
 * @date Created in 2020/2/24 17:32
 * @description
 */
@MapperScan("com.talentmap.common.mapper")
@SpringBootApplication
@EnableDiscoveryClient
public class FrontApplication {
    public static void main(String[] args) {
        SpringApplication.run(FrontApplication.class, args);
    }
}
