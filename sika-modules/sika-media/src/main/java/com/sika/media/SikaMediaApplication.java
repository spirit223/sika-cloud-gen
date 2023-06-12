package com.sika.media;

import com.sika.common.security.annotation.EnableCustomConfig;
import com.sika.common.security.annotation.EnableRyFeignClients;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;
import com.sika.media.util.ACSConstant;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author 吴畅
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class SikaMediaApplication {
    public static void main(String[] args) {
        SpringApplication.run(SikaMediaApplication.class, args);
        System.out.println("媒资模块启动成功 \n" +
                "   _____ _ _         __  __          _ _       \n" +
                "  / ____(_) |       |  \\/  |        | (_)      \n" +
                " | (___  _| | ____ _| \\  / | ___  __| |_  __ _ \n" +
                "  \\___ \\| | |/ / _` | |\\/| |/ _ \\/ _` | |/ _` |\n" +
                "  ____) | |   < (_| | |  | |  __/ (_| | | (_| |\n" +
                " |_____/|_|_|\\_\\__,_|_|  |_|\\___|\\__,_|_|\\__,_|\n" +
                "                                               \n" +
                "                                               ");
    }
}
