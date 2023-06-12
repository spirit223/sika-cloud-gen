package com.sika.job;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.sika.common.security.annotation.EnableCustomConfig;
import com.sika.common.security.annotation.EnableRyFeignClients;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 定时任务
 * 
 
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients   
@SpringBootApplication
public class SikaJobApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaJobApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  定时任务模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                    _       _     \n" +
                "  / ____(_) |                  | |     | |    \n" +
                " | (___  _| | ____ _ ______    | | ___ | |__  \n" +
                "  \\___ \\| | |/ / _` |______|   | |/ _ \\| '_ \\ \n" +
                "  ____) | |   < (_| |     | |__| | (_) | |_) |\n" +
                " |_____/|_|_|\\_\\__,_|      \\____/ \\___/|_.__/ \n" +
                "                                              \n" +
                "                                              \n");
    }
}
