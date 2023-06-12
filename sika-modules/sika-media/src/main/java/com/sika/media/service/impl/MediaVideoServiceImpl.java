package com.sika.media.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.StringJoiner;
import java.util.stream.Stream;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.DeleteVideoResponse;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;
import com.sika.common.core.utils.DateUtils;
import com.sika.media.InsertException;
import com.sika.media.util.MediaManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import com.sika.media.mapper.MediaVideoMapper;
import com.sika.media.domain.MediaVideo;
import com.sika.media.service.IMediaVideoService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * 视频资源Service业务层处理
 * 
 * @author 小吴来哩
 */
@Service
@Slf4j
public class MediaVideoServiceImpl implements IMediaVideoService 
{
    @Resource
    private MediaVideoMapper mediaVideoMapper;

    /**
     * 查询视频资源
     * 
     * @param id 视频资源主键
     * @return 视频资源
     */
    @Override
    public MediaVideo selectMediaVideoById(String id)
    {
        return mediaVideoMapper.selectMediaVideoById(id);
    }

    @Override
    public String selectMediaVideoURLById(String id) {
        return mediaVideoMapper.selectPlayURL(id);
    }

    /**
     * 查询视频资源列表
     * 
     * @param mediaVideo 视频资源
     * @return 视频资源
     */
    @Override
    public List<MediaVideo> selectMediaVideoList(MediaVideo mediaVideo)
    {
        return mediaVideoMapper.selectMediaVideoList(mediaVideo);
    }

    /**
     * 新增视频资源
     * 
     * @param mediaVideo 视频资源
     * @return 结果
     */
    @Override
    public int insertMediaVideo(MediaVideo mediaVideo)
    {
        mediaVideo.setCreateTime(DateUtils.getNowDate());
        return mediaVideoMapper.insertMediaVideo(mediaVideo);
    }

    /**
     * 修改视频资源
     * 
     * @param mediaVideo 视频资源
     * @return 结果
     */
    @Override
    public int updateMediaVideo(MediaVideo mediaVideo)
    {
        mediaVideo.setUpdateTime(DateUtils.getNowDate());
        return mediaVideoMapper.updateMediaVideo(mediaVideo);
    }

    /**
     * 批量删除视频资源
     * 
     * @param ids 需要删除的视频资源主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteMediaVideoByIds(String[] ids)
    {
        int beforeDeleteSize = MediaManager.getAllVideos().size();
        /* 拼接字符串数组 */
        StringJoiner stringJoiner = new StringJoiner(",");
        Stream.of(ids).forEach(stringJoiner::add);
        String videoIds = stringJoiner.toString();
        DeleteVideoRequest request = new DeleteVideoRequest();
        /* 删除单个或多个数据 */
        request.setVideoIds(videoIds);
        DefaultAcsClient client = MediaManager.initVodClient();
        try {
            DeleteVideoResponse response = client.getAcsResponse(request);

            /* 同步数据表 */
            mediaVideoMapper.deleteMediaVideoByIds(ids);

            return beforeDeleteSize - MediaManager.getAllVideos().size();
        } catch (ClientException e) {
            log.error("ErrorMessage = {}", e.getLocalizedMessage());
            return 0;
        }
    }

    /**
     * 删除视频资源信息
     * 
     * @param id 视频资源主键
     * @return 结果
     */
    @Override
    public int deleteMediaVideoById(Long id)
    {
        return mediaVideoMapper.deleteMediaVideoById(id);
    }
    
    

    @Override
    @Transactional
    public String uploadFile(MultipartFile multipartFile) {
        String videoId = null;
        try {
            /* 获取文件信息 */
            String filename = multipartFile.getOriginalFilename();
            String title = filename;
            if (filename != null && filename.contains(".")) {
                title = filename.substring(0, filename.lastIndexOf("."));
            }
            /* 获取流上传请求对象 */
            UploadStreamRequest request = MediaManager.getUploadStreamRequest(title, filename, multipartFile.getInputStream());
            /* 点播服务接入点 */
            request.setApiRegionId("cn-shanghai");
            UploadVideoImpl uploader = new UploadVideoImpl();
            /* 上传流 */
            UploadStreamResponse response = uploader.uploadStream(request);
            /* 文件上传成功 */
            if (response.isSuccess()) {
                videoId = response.getVideoId();
                /* 同步信息到表中 */
                insertVideoMessage(videoId, filename, title);
            }
            /* 文件上传失败 */
            else {
                //如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。
                // 其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因
                videoId = response.getVideoId();
                if (videoId == null) {
                    log.error("文件上传失败, 失败状态码为: {} ,\n错误信息为: {}", response.getCode(), response.getMessage());
                }
            }
            return videoId;
        } catch (IOException e) {
            log.error("文件上传获取文件对象失败或开启文件流失败");
            return videoId;
        } catch (ParseException e) {
            log.error("文件创建时间解析失败, {}", e.getMessage());
            return videoId;
        } catch (InsertException e) {
            log.error("文件插入失败, {}", e.getMessage());
            return videoId;
        }
    }

    private int insertVideoMessage(String videoId, String filename, String title) throws ParseException, InsertException {

        GetPlayInfoResponse.PlayInfo playInfo = MediaManager.getPlayInfoByVideoId(videoId).getPlayInfoList().get(0);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        MediaVideo mediaVideo = new MediaVideo();
        mediaVideo.setId(videoId);
        mediaVideo.setVideoName(title);
        mediaVideo.setVideoSourceId(playInfo.getPlayURL());
        mediaVideo.setVideoOriginalName(filename);
        mediaVideo.setCreateTime(simpleDateFormat.parse(MediaManager.getVideoInfoResponse(videoId).getVideo().getCreateTime()));
        int insertResult = mediaVideoMapper.insertMediaVideo(mediaVideo);
        if (insertResult <= 0) {
            throw new InsertException();
        }
        return insertResult;
    }
}
