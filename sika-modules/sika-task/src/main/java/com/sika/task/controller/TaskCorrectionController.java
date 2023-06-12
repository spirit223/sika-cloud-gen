package com.sika.task.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

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
import com.sika.task.domain.TaskCorrection;
import com.sika.task.service.ITaskCorrectionService;
import com.sika.common.core.web.controller.BaseController;
import com.sika.common.core.web.domain.AjaxResult;
import com.sika.common.core.utils.poi.ExcelUtil;
import com.sika.common.core.web.page.TableDataInfo;

/**
 * 任务批改Controller
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
@RestController
@RequestMapping("/correction")
public class TaskCorrectionController extends BaseController
{
    @Resource(name = "taskCorrectionServiceImpl")
    private ITaskCorrectionService taskCorrectionService;

    /**
     * 查询任务批改列表
     */
    @RequiresPermissions("task:correction:list")
    @GetMapping("/list")
    public TableDataInfo list(TaskCorrection taskCorrection)
    {
        startPage();
        List<TaskCorrection> list = taskCorrectionService.selectTaskCorrectionList(taskCorrection);
        return getDataTable(list);
    }

    /**
     * 导出任务批改列表
     */
    @RequiresPermissions("task:correction:export")
    @Log(title = "任务批改", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TaskCorrection taskCorrection)
    {
        List<TaskCorrection> list = taskCorrectionService.selectTaskCorrectionList(taskCorrection);
        ExcelUtil<TaskCorrection> util = new ExcelUtil<>(TaskCorrection.class);
        util.exportExcel(response, list, "任务批改数据");
    }

    /**
     * 获取任务批改详细信息
     */
    @RequiresPermissions("task:correction:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long submitId)
    {
        return success(taskCorrectionService.selectTaskCorrectionById(submitId));
    }

    /**
     * 新增任务批改
     */
    @RequiresPermissions("task:correction:add")
    @Log(title = "任务批改", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskCorrection taskCorrection)
    {
        taskCorrection.setCreateBy(SecurityUtils.getUsername());
        int correctResult = taskCorrectionService.insertTaskCorrection(taskCorrection);
        return toAjax(correctResult);
    }

    /**
     * 修改任务批改
     */
    @RequiresPermissions("task:correction:edit")
    @Log(title = "任务批改", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskCorrection taskCorrection)
    {
        return toAjax(taskCorrectionService.updateTaskCorrection(taskCorrection));
    }

    /**
     * 删除任务批改
     */
    @RequiresPermissions("task:correction:remove")
    @Log(title = "任务批改", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(taskCorrectionService.deleteTaskCorrectionByIds(ids));
    }
}
