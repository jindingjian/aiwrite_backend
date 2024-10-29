package com.youlai.boot.system.controller;

import com.youlai.boot.system.service.AigcOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.youlai.boot.system.model.form.AigcOrderForm;
import com.youlai.boot.system.model.query.AigcOrderQuery;
import com.youlai.boot.system.model.vo.AigcOrderVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.youlai.boot.common.result.PageResult;
import com.youlai.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;

import java.util.List;

/**
 * aigc文件上传记录前端控制层
 *
 * @author tshy
 * @since 2024-10-23 16:13
 */
@Tag(name = "aigc文件上传记录接口")
@RestController
@RequestMapping("/api/v1/aigcOrders")
@RequiredArgsConstructor
public class AigcOrderController  {

    private final AigcOrderService aigcOrderService;

    @Operation(summary = "aigc文件上传记录分页列表")
    @GetMapping("/page")
//    @PreAuthorize("@ss.hasPerm('system:aigcOrder:query')")
    public PageResult<AigcOrderVO> getAigcOrderPage(AigcOrderQuery queryParams ) {
        IPage<AigcOrderVO> result = aigcOrderService.getAigcOrderPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增aigc文件上传记录")
    @PostMapping
//    @PreAuthorize("@ss.hasPerm('system:aigcOrder:add')")
    public Result<Void> saveAigcOrder(@RequestBody @Valid AigcOrderForm formData ) {
        boolean result = aigcOrderService.saveAigcOrder(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取aigc文件上传记录表单数据")
    @GetMapping("/{id}/form")
//    @PreAuthorize("@ss.hasPerm('system:aigcOrder:edit')")
    public Result<AigcOrderForm> getAigcOrderForm(
        @Parameter(description = "aigc文件上传记录ID") @PathVariable Long id
    ) {
        AigcOrderForm formData = aigcOrderService.getAigcOrderFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改aigc文件上传记录")
    @PutMapping(value = "/{id}")
//    @PreAuthorize("@ss.hasPerm('system:aigcOrder:edit')")
    public Result<Void> updateAigcOrder(
            @Parameter(description = "aigc文件上传记录ID") @PathVariable Long id,
            @RequestBody @Validated AigcOrderForm formData
    ) {
        boolean result = aigcOrderService.updateAigcOrder(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除aigc文件上传记录")
    @DeleteMapping("/{ids}")
//    @PreAuthorize("@ss.hasPerm('system:aigcOrder:delete')")
    public Result<Void> deleteAigcOrders(
        @Parameter(description = "aigc文件上传记录ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aigcOrderService.deleteAigcOrders(ids);
        return Result.judge(result);
    }

    @Operation(summary = "用户表单数据")
    @GetMapping("/{userId}/AigcOrderForms")
    public Result<List<AigcOrderForm>> getAigcOrderForms(
            @Parameter(description = "用户ID") @PathVariable Long userId
    ) {
        List<AigcOrderForm> aigcOrderForm = aigcOrderService.getAigcOrderByUserId(userId);
        return Result.success(aigcOrderForm);
    }
}
