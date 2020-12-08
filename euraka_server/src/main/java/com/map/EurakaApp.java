package com.map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * @Description:
 * @author: liyuan
 * @data 2020-04-20 14:54
 */
@SpringBootApplication
@EnableEurekaServer
public class EurakaApp {
    public static void main(String[] args) {
        SpringApplication.run(EurakaApp.class,args);
    }
}
