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
import com.sika.task.domain.TaskTask;
import com.sika.task.service.ITaskTaskService;
import com.sika.common.core.web.controller.BaseController;
import com.sika.common.core.web.domain.AjaxResult;
import com.sika.common.core.utils.poi.ExcelUtil;
import com.sika.common.core.web.page.TableDataInfo;

/**
 * 教学任务Controller
 * 
 * @author 小吴来哩
 * @date 2023-05-15
 */
@RestController
@RequestMapping("/task")
public class TaskTaskController extends BaseController
{
    @Resource(name = "taskTaskServiceImpl")
    private ITaskTaskService taskTaskService;

    /**
     * 查询教学任务列表
     */
    @RequiresPermissions("task:task:list")
    @GetMapping("/list")
    public TableDataInfo list(TaskTask taskTask)
    {
        startPage();
        List<TaskTask> list = taskTaskService.selectTaskTaskList(taskTask, SecurityUtils.getUsername());
        return getDataTable(list);
    }

    /**
     * 导出教学任务列表
     */
    @RequiresPermissions("task:task:export")
    @Log(title = "教学任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TaskTask taskTask)
    {
        List<TaskTask> list = taskTaskService.selectTaskTaskList(taskTask);
        ExcelUtil<TaskTask> util = new ExcelUtil<TaskTask>(TaskTask.class);
        util.exportExcel(response, list, "教学任务数据");
    }

    /**
     * 获取教学任务详细信息
     */
    @RequiresPermissions("task:task:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(taskTaskService.selectTaskTaskById(id, SecurityUtils.getUsername()));
    }

    /**
     * 新增教学任务
     */
    @RequiresPermissions("task:task:add")
    @Log(title = "教学任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskTask taskTask)
    {
        taskTask.setCreateBy(SecurityUtils.getUsername());
        return toAjax(taskTaskService.insertTaskTask(taskTask));
    }

    /**
     * 修改教学任务
     */
    @RequiresPermissions("task:task:edit")
    @Log(title = "教学任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskTask taskTask)
    {
        return toAjax(taskTaskService.updateTaskTask(taskTask));
    }

    /**
     * 删除教学任务
     */
    @RequiresPermissions("task:task:remove")
    @Log(title = "教学任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(taskTaskService.deleteTaskTaskByIds(ids));
    }
}
