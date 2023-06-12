package com.sika.media.mapper;

import java.util.List;
import com.sika.media.domain.MediaVideo;

/**
 * 视频资源Mapper接口
 * 
 * @author 小吴来哩
 */
public interface MediaVideoMapper 
{
    void truncateTable();


    String selectPlayURL(String id);

    /**
     * 查询视频资源
     * 
     * @param id 视频资源主键
     * @return 视频资源
     */
    public MediaVideo selectMediaVideoById(String id);

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
     * 删除视频资源
     * 
     * @param id 视频资源主键
     * @return 结果
     */
    public int deleteMediaVideoById(Long id);

    /**
     * 批量删除视频资源
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMediaVideoByIds(String[] ids);
}
