package com.sika.media.util;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * @author 吴畅
 */
@Configuration("ACSConstant")
public class ACSConstant implements InitializingBean {

    @Value("${aliyun.vod.file.AccessKeyID}")
    private String accessKeyID;
    @Value("${aliyun.vod.file.AccessKeySecret}")
    private String accessKeySecret;
    @Value("${aliyun.vod.file.regionId}")
    private String regionId;
    @Value("${aliyun.vod.file.Endpoint}")
    private String endpoint;
    @Value("${aliyun.vod.file.BucketName}")
    private String bucketName;

    public static String AccessKeyID;
    public static String AccessKeySecret;
    public static String RegionId;
    public static String Endpoint;
    public static String BucketName;

    @Override
    public void afterPropertiesSet() throws Exception {
        AccessKeyID = accessKeyID;
        AccessKeySecret = accessKeySecret;
        RegionId = regionId;
        Endpoint = endpoint;
        BucketName = bucketName;
    }
}
