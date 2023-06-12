package com.sika.data.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.sika.common.core.exception.file.InvalidExtensionException;
import com.sika.common.security.utils.SecurityUtils;
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
import com.sika.data.domain.TaskData;
import com.sika.data.service.ITaskDataService;
import com.sika.common.core.web.controller.BaseController;
import com.sika.common.core.web.domain.AjaxResult;
import com.sika.common.core.utils.poi.ExcelUtil;
import com.sika.common.core.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 资料Controller
 * 
 * @author 小吴来哩
 * @date 2023-04-21
 */
@RestController
@RequestMapping("/data")
public class TaskDataController extends BaseController
{
    @Autowired
    private ITaskDataService taskDataService;

    /**
     * 查询资料列表
     */
    @RequiresPermissions("data:data:list")
    @GetMapping("/list")
    public TableDataInfo list(TaskData taskData)
    {
        startPage();
        List<TaskData> list = taskDataService.selectTaskDataList(taskData);
        return getDataTable(list);
    }

    /**
     * 导出资料列表
     */
    @RequiresPermissions("data:data:export")
    @Log(title = "资料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TaskData taskData)
    {
        List<TaskData> list = taskDataService.selectTaskDataList(taskData);
        ExcelUtil<TaskData> util = new ExcelUtil<TaskData>(TaskData.class);
        util.exportExcel(response, list, "资料数据");
    }

    /**
     * 获取资料详细信息
     */
    @RequiresPermissions("data:data:query")
    @GetMapping(value = "/{dId}")
    public AjaxResult getInfo(@PathVariable("dId") Long dId)
    {
        return success(taskDataService.selectTaskDataByDId(dId));
    }

    /**
     * 新增资料
     */
    @RequiresPermissions("data:data:add")
    @Log(title = "资料", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskData taskData)
    {
        return toAjax(taskDataService.insertTaskData(taskData));
    }

    /**
     * 新增资料
     */
    @RequiresPermissions("data:data:add")
    @Log(title = "资料", businessType = BusinessType.INSERT)
    @PostMapping("upload")
    public AjaxResult add(@RequestBody MultipartFile file) throws IOException, InvalidExtensionException {
        TaskData taskData = new TaskData();
        taskData.setCreateBy(SecurityUtils.getUsername());
        return toAjax(taskDataService.insertTaskData(taskData, file));
    }

    /**
     * 修改资料
     */
    @RequiresPermissions("data:data:edit")
    @Log(title = "资料", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskData taskData)
    {
        return toAjax(taskDataService.updateTaskData(taskData));
    }

    /**
     * 删除资料
     */
    @RequiresPermissions("data:data:remove")
    @Log(title = "资料", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dIds}")
    public AjaxResult remove(@PathVariable Long[] dIds)
    {
        return toAjax(taskDataService.deleteTaskDataByDIds(dIds));
    }
}
