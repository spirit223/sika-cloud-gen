package com.sika.system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.sika.common.security.annotation.EnableCustomConfig;
import com.sika.common.security.annotation.EnableRyFeignClients;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 系统模块
 * 

 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class SikaSystemApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaSystemApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                _____           _                 \n" +
                "  / ____(_) |              / ____|         | |                \n" +
                " | (___  _| | ____ _ _____| (___  _   _ ___| |_ ___ _ __ ___  \n" +
                "  \\___ \\| | |/ / _` |______\\___ \\| | | / __| __/ _ \\ '_ ` _ \\ \n" +
                "  ____) | |   < (_| |      ____) | |_| \\__ \\ ||  __/ | | | | |\n" +
                " |_____/|_|_|\\_\\__,_|     |_____/ \\__, |___/\\__\\___|_| |_| |_|\n" +
                "                                   __/ |                      \n" +
                "                                  |___/                       \n");
    }
}
