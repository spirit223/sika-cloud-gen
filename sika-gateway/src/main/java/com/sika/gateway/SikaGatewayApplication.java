package com.sika.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 网关启动程序
 * 
 
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class SikaGatewayApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaGatewayApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  Sika网关启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                 _____       _                           \n" +
                "  / ____(_) |               / ____|     | |                          \n" +
                " | (___  _| | ____ _ ______| |  __  __ _| |_ _____      ____ _ _   _ \n" +
                "  \\___ \\| | |/ / _` |______| | |_ |/ _` | __/ _ \\ \\ /\\ / / _` | | | |\n" +
                "  ____) | |   < (_| |      | |__| | (_| | ||  __/\\ V  V / (_| | |_| |\n" +
                " |_____/|_|_|\\_\\__,_|       \\_____|\\__,_|\\__\\___| \\_/\\_/ \\__,_|\\__, |\n" +
                "                                                                __/ |\n" +
                "                                                               |___/ \n");
    }
}
