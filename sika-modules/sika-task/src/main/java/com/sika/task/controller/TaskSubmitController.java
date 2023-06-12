package com.sika.task.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import com.sika.common.security.utils.SecurityUtils;
import com.sika.task.domain.SubmitRecord;
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
import com.sika.task.domain.TaskSubmit;
import com.sika.task.service.ITaskSubmitService;
import com.sika.common.core.web.controller.BaseController;
import com.sika.common.core.web.domain.AjaxResult;
import com.sika.common.core.utils.poi.ExcelUtil;
import com.sika.common.core.web.page.TableDataInfo;

/**
 * 提交记录Controller
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
@RestController
@RequestMapping("/submit")
public class TaskSubmitController extends BaseController
{
    @Resource(name = "taskSubmitServiceImpl")
    private ITaskSubmitService taskSubmitService;

//    /**
//     * 查询提交记录列表
//     */
//    @RequiresPermissions("task:submit:list")
//    @GetMapping("/list")
//    public TableDataInfo list(TaskSubmit taskSubmit)
//    {
//        startPage();
//        List<TaskSubmit> list = taskSubmitService.selectTaskSubmitList(taskSubmit);
//        return getDataTable(list);
//    }
    /**
     * 查询提交记录列表
     */
    @RequiresPermissions("task:submit:list")
    @GetMapping("/list")
    public TableDataInfo list(TaskSubmit taskSubmit)
    {
        startPage();
        if (taskSubmit.getUserId() == null) {
            taskSubmit.setUserId(SecurityUtils.getUserId());
        }
        List<SubmitRecord> list = taskSubmitService.selectTaskSubmitList(taskSubmit);
        return getDataTable(list);
    }

    /**
     * 查询未提交
     */
    @RequiresPermissions("task:submit:list")
    @GetMapping("/list-uncommitted")
    public TableDataInfo listUnCommitted(TaskSubmit taskSubmit) {
        startPage();
        List<SubmitRecord> list = taskSubmitService.selectUncommittedList(SecurityUtils.getUserId());
        return getDataTable(list);
    }

    /**
     * 导出提交记录列表
     */
    @RequiresPermissions("task:submit:export")
    @Log(title = "提交记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TaskSubmit taskSubmit)
    {
        List<SubmitRecord> list = taskSubmitService.selectTaskSubmitList(taskSubmit);
        ExcelUtil<SubmitRecord> util = new ExcelUtil<>(SubmitRecord.class);
        util.exportExcel(response, list, "提交记录数据");
    }

    /**
     * 获取提交记录详细信息
     */
    @RequiresPermissions("task:submit:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long taskId)
    {
        SubmitRecord submitRecord = taskSubmitService.selectTaskSubmitById(taskId);
        submitRecord.setUserId(SecurityUtils.getUserId());
        return success(submitRecord);
    }

    /**
     * 新增提交记录
     */
    @RequiresPermissions("task:submit:add")
    @Log(title = "提交记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskSubmit taskSubmit)
    {
        return toAjax(taskSubmitService.insertTaskSubmit(taskSubmit));
    }

    /**
     * 修改提交记录
     */
    @RequiresPermissions("task:submit:edit")
    @Log(title = "提交记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskSubmit taskSubmit)
    {
        return toAjax(taskSubmitService.updateTaskSubmit(taskSubmit));
    }

    /**
     * 删除提交记录
     */
    @RequiresPermissions("task:submit:remove")
    @Log(title = "提交记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(taskSubmitService.deleteTaskSubmitByIds(ids));
    }
}
