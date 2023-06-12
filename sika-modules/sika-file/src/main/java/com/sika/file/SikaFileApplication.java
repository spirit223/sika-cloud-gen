package com.sika.file;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import com.sika.common.swagger.annotation.EnableCustomSwagger2;

/**
 * 文件服务
 * 

 */
@EnableCustomSwagger2
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class SikaFileApplication
{
    public static void main(String[] args)
    {
        SpringApplication.run(SikaFileApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  文件服务模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "   _____ _ _                ______ _ _      \n" +
                "  / ____(_) |              |  ____(_) |     \n" +
                " | (___  _| | ____ _ ______| |__   _| | ___ \n" +
                "  \\___ \\| | |/ / _` |______|  __| | | |/ _ \\\n" +
                "  ____) | |   < (_| |      | |    | | |  __/\n" +
                " |_____/|_|_|\\_\\__,_|      |_|    |_|_|\\___|\n" +
                "                                            \n" +
                "                                            \n");
    }
}
