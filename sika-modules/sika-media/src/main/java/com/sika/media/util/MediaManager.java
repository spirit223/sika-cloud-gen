package com.sika.media.util;

import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.vod.model.v20170321.*;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.SimpleTimeZone;

/**
 * @author 吴畅
 */
@Component
@DependsOn("ACSConstant")
public class MediaManager {

    /**
     * 获取文件上传请求对象
     * @param title 文件名称
     * @param fileName 文件全名(包含扩展名)
     * @param inputStream 文件流对象
     * @return UploadStreamRequest
     */
    public static UploadStreamRequest getUploadStreamRequest(String title, String fileName, InputStream inputStream) {
        return new UploadStreamRequest(ACSConstant.AccessKeyID, ACSConstant.AccessKeySecret, title, fileName, inputStream);
    }

    /**
     * 通过视频id获取视频信息响应对象
     * @param videoId 视频id
     * @return GetPlayInfoResponse 播放信息响应对象
     */
    public static GetPlayInfoResponse getPlayInfoByVideoId(String videoId){
        GetPlayInfoRequest request = new GetPlayInfoRequest();
        request.setVideoId(videoId);
        try {
            return initVodClient().getAcsResponse(request);
        } catch (ClientException e) {
            throw new RuntimeException(e);
        }
    }

    @Deprecated
    public static GetPlayInfoResponse getPlayInfo(DefaultAcsClient client) throws ClientException {
        GetPlayInfoRequest request = new GetPlayInfoRequest();
        request.setVideoId("530aa380f39b71ed808c6732b68e0102");
        return client.getAcsResponse(request);
    }

    /**
     * 获取视频对象列表
     * @return 视频对象列表
     */
    public static List<GetVideoListResponse.Video> getAllVideos() {
        DefaultAcsClient defaultAcsClient = initVodClient();
        try {
            return getVideoListResponse(defaultAcsClient).getVideoList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取视频信息响应对象
     * @param defaultAcsClient defaultAcsClient
     * @param videoId videoId
     * @return 视频信息响应对象
     */
    public static GetVideoInfoResponse getVideoInfoResponse(DefaultAcsClient defaultAcsClient, String videoId) {
        GetVideoInfoRequest request = new GetVideoInfoRequest();
        request.setVideoId(videoId);
        try {
            return defaultAcsClient.getAcsResponse(request);
        } catch (ClientException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取视频信息响应对象
     * @param videoId videoId
     * @return GetVideoInfoResponse
     */
    public static GetVideoInfoResponse getVideoInfoResponse(String videoId) {
        GetVideoInfoRequest request = new GetVideoInfoRequest();
        request.setVideoId(videoId);
        try {
            return initVodClient().getAcsResponse(request);
        } catch (ClientException e) {
            throw new RuntimeException(e);
        }
    }


    /**
     * 获取视频列表响应对象
     * @param client 发送请求客户端
     * @return GetVideoListResponse 获取视频列表响应数据
     */
    public static GetVideoListResponse getVideoListResponse(DefaultAcsClient client) throws Exception {
        GetVideoListRequest request = new GetVideoListRequest();
        // 分别取一个月前、当前时间的UTC时间作为筛选视频列表的起止时间
        String monthAgoUTCTime = generateUTCTime(new Date(System.currentTimeMillis() - 30*86400*1000L));
        String nowUTCTime = generateUTCTime(new Date(System.currentTimeMillis()));
        // 视频创建的起始时间，为UTC格式
        request.setStartTime(monthAgoUTCTime);
        // 视频创建的结束时间，为UTC格式
        request.setEndTime(nowUTCTime);
        // 视频状态，默认获取所有状态的视频，多个用逗号分隔
        // request.setStatus("Uploading,Normal,Transcoding");
        request.setPageNo(1);
        request.setPageSize(50);
        return client.getAcsResponse(request);
    }

    // 请求示例
    public static void main(String[] argv) {
        DefaultAcsClient client = initVodClient("regionId", "accessKeyId", "accessKeySecret");


        /* 获取播放信息 */
//        GetPlayInfoResponse response = null;
//        try {
//            response = getPlayInfo(client);
//            List<GetPlayInfoResponse.PlayInfo> playInfoList = response.getPlayInfoList();
//            //播放地址
//            for (GetPlayInfoResponse.PlayInfo playInfo : playInfoList) {
//                System.out.println();
//                System.out.println("=====================================");
//                System.out.print("PlayInfo.PlayURL = " + playInfo.getPlayURL() + "\n");
//                System.out.println();
//                System.out.println();
//            }
//            //Base信息
//            System.out.print("VideoBase.Title = " + response.getVideoBase().getTitle() + "\n");
//        } catch (ClientException e) {
//            throw new RuntimeException(e);
//        }
//        System.out.print("RequestId = " + response.getRequestId() + "\n");


        /* 获取视频信息 */
        GetVideoListResponse response = new GetVideoListResponse();
        try {
            response = getVideoListResponse(client);
            // 根据指定筛选条件查询到的视频总数
            System.out.print("Total = " + response.getTotal() + "\n");
            for (GetVideoListResponse.Video video : response.getVideoList()) {
                System.out.print("Title = " + video.getTitle() + "\n");
                System.out.println("VideoID = " + video.getVideoId() + "\n");
                System.out.println("URL = " + video.getCoverURL() + "\n");
                System.out.println("CreationTime = " + video.getCreationTime() + "\n");
                System.out.println("CreateTime = " + video.getCreateTime() + "\n");
            }
        } catch (Exception e) {
            System.out.print("ErrorMessage = " + e.getLocalizedMessage());
        }
        System.out.print("RequestId = " + response.getRequestId() + "\n");
    }

    public static DefaultAcsClient initVodClient(String regionId, String accessKeyId, String accessKeySecret) {
        DefaultProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, accessKeySecret);
        return new DefaultAcsClient(profile);
    }

    /**
     * 获取点播操作客户端
     * @return DefaultAcsClient
     */
    public static DefaultAcsClient initVodClient() {
        String regionId = ACSConstant.RegionId;
        String accessKeyId = ACSConstant.AccessKeyID;
        String accessKeySecret = ACSConstant.AccessKeySecret;
        return initVodClient(regionId, accessKeyId, accessKeySecret);
    }

    // 根据Date时间生成UTC时间函数
    public static String generateUTCTime(Date time) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        dateFormat.setTimeZone(new SimpleTimeZone(SimpleTimeZone.UTC_TIME, "UTC"));
        dateFormat.setLenient(false);
        return dateFormat.format(time);
    }
}
