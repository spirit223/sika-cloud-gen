package com.sika.gen;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.sika.common.security.annotation.EnableCustomConfig;
import com.sika.common.security.annotation.EnableRyFeignClients;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 代码生成
 * 

 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class SikaGenApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaGenApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  代码生成模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                 _____            \n" +
                "  / ____(_) |               / ____|           \n" +
                " | (___  _| | ____ _ ______| |  __  ___ _ __  \n" +
                "  \\___ \\| | |/ / _` |______| | |_ |/ _ \\ '_ \\ \n" +
                "  ____) | |   < (_| |      | |__| |  __/ | | |\n" +
                " |_____/|_|_|\\_\\__,_|       \\_____|\\___|_| |_|\n" +
                "                                              \n" +
                "                                              \n");
    }
}
