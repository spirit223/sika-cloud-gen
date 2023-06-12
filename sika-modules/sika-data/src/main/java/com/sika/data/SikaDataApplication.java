package com.sika.data;

import com.sika.common.security.annotation.EnableCustomConfig;
import com.sika.common.security.annotation.EnableRyFeignClients;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author 吴畅
 * @创建时间 2023/4/21 - 17:24
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class SikaDataApplication {
    public static void main(String[] args) {
        SpringApplication.run(SikaDataApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  资料模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                _____        _        \n" +
                "  / ____(_) |              |  __ \\      | |       \n" +
                " | (___  _| | ____ _ ______| |  | | __ _| |_ __ _ \n" +
                "  \\___ \\| | |/ / _` |______| |  | |/ _` | __/ _` |\n" +
                "  ____) | |   < (_| |      | |__| | (_| | || (_| |\n" +
                " |_____/|_|_|\\_\\__,_|      |_____/ \\__,_|\\__\\__,_|\n");
    }
}
