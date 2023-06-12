package com.sika.media.service;

import java.util.List;
import com.sika.media.domain.MediaVideo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 视频资源Service接口
 * 
 * @author 小吴来哩
 */
public interface IMediaVideoService 
{
    /**
     * 查询视频资源
     * 
     * @param id 视频资源主键
     * @return 视频资源
     */
    public MediaVideo selectMediaVideoById(String id);

    String selectMediaVideoURLById(String id);

    /**
     * 查询视频资源列表
     * 
     * @param mediaVideo 视频资源
     * @return 视频资源集合
     */
    public List<MediaVideo> selectMediaVideoList(MediaVideo mediaVideo);

    /**
     * 新增视频资源
     * 
     * @param mediaVideo 视频资源
     * @return 结果
     */
    public int insertMediaVideo(MediaVideo mediaVideo);

    /**
     * 修改视频资源
     * 
     * @param mediaVideo 视频资源
     * @return 结果
     */
    public int updateMediaVideo(MediaVideo mediaVideo);

    /**
     * 批量删除视频资源
     * 
     * @param ids 需要删除的视频资源主键集合
     * @return 结果
     */
    public int deleteMediaVideoByIds(String[] ids);

    /**
     * 删除视频资源信息
     * 
     * @param id 视频资源主键
     * @return 结果
     */
    public int deleteMediaVideoById(Long id);

    /**
     * 通过文件对象上传文件到点播系统
     * @param multipartFile multipartFile文件对象
     * @return 上传成功后返回视频id
     */
    String uploadFile(MultipartFile multipartFile);
}
