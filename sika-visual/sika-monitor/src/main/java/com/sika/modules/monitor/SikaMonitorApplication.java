package com.sika.modules.monitor;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import de.codecentric.boot.admin.server.config.EnableAdminServer;

/**
 * 监控中心
 * 
 
 */
@EnableAdminServer
@SpringBootApplication
public class SikaMonitorApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaMonitorApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  监控中心启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                __  __             _ _             \n" +
                "  / ____(_) |              |  \\/  |           (_) |            \n" +
                " | (___  _| | ____ _ ______| \\  / | ___  _ __  _| |_ ___  _ __ \n" +
                "  \\___ \\| | |/ / _` |______| |\\/| |/ _ \\| '_ \\| | __/ _ \\| '__|\n" +
                "  ____) | |   < (_| |      | |  | | (_) | | | | | || (_) | |   \n" +
                " |_____/|_|_|\\_\\__,_|      |_|  |_|\\___/|_| |_|_|\\__\\___/|_|   \n" +
                "                                                               \n" +
                "                                                               \n");
    }
}
