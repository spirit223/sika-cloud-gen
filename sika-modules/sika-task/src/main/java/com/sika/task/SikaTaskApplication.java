package com.sika.task;

import com.sika.common.security.annotation.EnableCustomConfig;
import com.sika.common.security.annotation.EnableRyFeignClients;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author 吴畅
 * 2023/5/15 - 11:25
 */
@EnableCustomConfig
@EnableCustomSwagger2
@EnableRyFeignClients
@SpringBootApplication
public class SikaTaskApplication {
    public static void main(String[] args) {
        SpringApplication.run(SikaTaskApplication.class, args);
        System.out.println("任务模块启动成功 \n" + "\n" +
                "  _________.__ __         ___________              __    \n" +
                " /   _____/|__|  | _______\\__    ___/____    _____|  | __\n" +
                " \\_____  \\ |  |  |/ /\\__  \\ |    |  \\__  \\  /  ___/  |/ /\n" +
                " /        \\|  |    <  / __ \\|    |   / __ \\_\\___ \\|    < \n" +
                "/_______  /|__|__|_ \\(____  /____|  (____  /____  >__|_ \\\n" +
                "        \\/         \\/     \\/             \\/     \\/     \\/\n");
    }
}
