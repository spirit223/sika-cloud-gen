package com.sika.media.listener;

import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;
import com.aliyuncs.vod.model.v20170321.GetVideoListResponse;
import com.sika.media.domain.MediaVideo;
import com.sika.media.mapper.MediaVideoMapper;
import com.sika.media.util.MediaManager;
import org.springframework.boot.availability.AvailabilityChangeEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 从云端服务器获取所有视频数据, 重刷数据库数据
 * @author 吴畅
 * @创建时间 2023/5/16 - 15:01
 */
@Component
public class VideoSyncListener implements ApplicationListener<AvailabilityChangeEvent> {
    @Resource
    private MediaVideoMapper videoMapper;

    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public void onApplicationEvent(AvailabilityChangeEvent event) {
        /* video信息列表 */
        List<GetVideoListResponse.Video> allVideos = MediaManager.getAllVideos();
        /* 清空数据表 */
        videoMapper.truncateTable();
        /* 通过video对象获取videoId, 调用管理器获取视频播放连接 */
        for (GetVideoListResponse.Video video : allVideos) {

            MediaVideo mediaVideo = new MediaVideo();

            String videoId = video.getVideoId();

            String playURL = MediaManager.getPlayInfoByVideoId(videoId).getPlayInfoList().get(0).getPlayURL();

            mediaVideo.setId(videoId);
            mediaVideo.setVideoSourceId(playURL);
            if (video.getTitle().contains(".")) {
                mediaVideo.setVideoName(video.getTitle().substring(0, video.getTitle().lastIndexOf(".")));
            } else {
                mediaVideo.setVideoName(video.getTitle());
            }
            mediaVideo.setVideoOriginalName(video.getTitle());
            try {
                mediaVideo.setCreateTime(dateFormat.parse(video.getCreateTime()));
            } catch (ParseException e) {
                mediaVideo.setCreateTime(null);
            } catch (StringIndexOutOfBoundsException out) {
                System.out.println(video.getTitle());
            }

            videoMapper.insertMediaVideo(mediaVideo);
        }
    }
}
