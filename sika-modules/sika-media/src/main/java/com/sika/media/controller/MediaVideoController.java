package com.sika.media.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.sika.media.util.MediaManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.sika.common.log.annotation.Log;
import com.sika.common.log.enums.BusinessType;
import com.sika.common.security.annotation.RequiresPermissions;
import com.sika.media.domain.MediaVideo;
import com.sika.media.service.IMediaVideoService;
import com.sika.common.core.web.controller.BaseController;
import com.sika.common.core.web.domain.AjaxResult;
import com.sika.common.core.utils.poi.ExcelUtil;
import com.sika.common.core.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 视频资源Controller
 * 
 * @author 小吴来哩
 */
@RestController
@RequestMapping("/video")
public class MediaVideoController extends BaseController
{
    @Resource(name = "mediaVideoServiceImpl")
    private IMediaVideoService mediaVideoService;

    /**
     * 查询视频资源列表
     */
    @RequiresPermissions("media:video:list")
    @GetMapping("/list")
    public TableDataInfo list(MediaVideo mediaVideo)
    {
        startPage();
        List<MediaVideo> list = mediaVideoService.selectMediaVideoList(mediaVideo);
        return getDataTable(list);
    }

    /**
     * 导出视频资源列表
     */
    @RequiresPermissions("media:video:export")
    @Log(title = "视频资源", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MediaVideo mediaVideo)
    {
        List<MediaVideo> list = mediaVideoService.selectMediaVideoList(mediaVideo);
        ExcelUtil<MediaVideo> util = new ExcelUtil<MediaVideo>(MediaVideo.class);
        util.exportExcel(response, list, "视频资源数据");
    }

    /**
     * 获取视频资源详细信息
     */
    @RequiresPermissions("media:video:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") String id)
    {
        return success(mediaVideoService.selectMediaVideoById(id));
    }

    /**
     * 获取播放地址
     * @param id videoId
     * @return 视频http播放连接
     */
    @RequiresPermissions("media:video:query")
    @GetMapping(value = "/play/{id}")
    public AjaxResult getPlayURL(@PathVariable("id") String id) {
        return success(mediaVideoService.selectMediaVideoById(id));
    }


    /**
     * 新增视频资源
     */
    @RequiresPermissions("media:video:add")
    @Log(title = "视频资源", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(MultipartFile multipartFile)
    {
        // 上传视频
        String videoId = mediaVideoService.uploadFile(multipartFile);
        if (videoId != null) {
            return AjaxResult.success("文件上传成功");
        }
        return AjaxResult.error("文件上传失败");
    }


    /**
     * 删除视频资源
     */
    @RequiresPermissions("media:video:remove")
    @Log(title = "视频资源", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable String[] ids)
    {
        return toAjax(mediaVideoService.deleteMediaVideoByIds(ids));
    }
}