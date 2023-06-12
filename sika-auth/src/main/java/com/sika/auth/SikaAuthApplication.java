package com.sika.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.sika.common.security.annotation.EnableRyFeignClients;

/**
 * 认证授权中心
 *
 */
@EnableRyFeignClients
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class SikaAuthApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaAuthApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  认证授权中心启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                            _   _     \n" +
                "  / ____(_) |                /\\        | | | |    \n" +
                " | (___  _| | ____ _ ______ /  \\  _   _| |_| |__  \n" +
                "  \\___ \\| | |/ / _` |______/ /\\ \\| | | | __| '_ \\ \n" +
                "  ____) | |   < (_| |     / ____ \\ |_| | |_| | | |\n" +
                " |_____/|_|_|\\_\\__,_|    /_/    \\_\\__,_|\\__|_| |_|\n" +
                "                                                  \n" +
                "                                                  \n");
    }
}
