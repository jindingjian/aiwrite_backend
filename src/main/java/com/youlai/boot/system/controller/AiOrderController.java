package com.youlai.boot.system.controller;

import com.youlai.boot.system.model.form.AigcOrderForm;
import com.youlai.boot.system.service.AiOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.youlai.boot.system.model.form.AiOrderForm;
import com.youlai.boot.system.model.query.AiOrderQuery;
import com.youlai.boot.system.model.vo.AiOrderVO;
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
 * 订单提交记录前端控制层
 *
 * @author tshy
 * @since 2024-10-24 09:38
 */
@Tag(name = "订单提交记录接口")
@RestController
@RequestMapping("/api/v1/aiOrders")
@RequiredArgsConstructor
public class AiOrderController  {

    private final AiOrderService aiOrderService;

    @Operation(summary = "订单提交记录分页列表")
    @GetMapping("/page")
//    @PreAuthorize("@ss.hasPerm('system:aiOrder:query')")
    public PageResult<AiOrderVO> getAiOrderPage(AiOrderQuery queryParams ) {
        IPage<AiOrderVO> result = aiOrderService.getAiOrderPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增订单提交记录")
    @PostMapping("/save")
//    @PreAuthorize("@ss.hasPerm('system:aiOrder:add')")
    public Result<Void> saveAiOrder(@RequestBody @Valid AiOrderForm formData ) {
        boolean result = aiOrderService.saveAiOrder(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取订单提交记录表单数据")
    @GetMapping("/{id}/form")
//    @PreAuthorize("@ss.hasPerm('system:aiOrder:edit')")
    public Result<AiOrderForm> getAiOrderForm(
        @Parameter(description = "订单提交记录ID") @PathVariable Long id
    ) {
        AiOrderForm formData = aiOrderService.getAiOrderFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改订单提交记录")
    @PutMapping(value = "/{id}")
//    @PreAuthorize("@ss.hasPerm('system:aiOrder:edit')")
    public Result<Void> updateAiOrder(
            @Parameter(description = "订单提交记录ID") @PathVariable Long id,
            @RequestBody @Validated AiOrderForm formData
    ) {
        boolean result = aiOrderService.updateAiOrder(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除订单提交记录")
    @DeleteMapping("/{ids}")
//    @PreAuthorize("@ss.hasPerm('system:aiOrder:delete')")
    public Result<Void> deleteAiOrders(
        @Parameter(description = "订单提交记录ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aiOrderService.deleteAiOrders(ids);
        return Result.judge(result);
    }

    @Operation(summary = "用户表单数据")
    @GetMapping("/{userId}/AiOrderForms")
    public Result<List<AiOrderForm>> getAiOrderForms(
            @Parameter(description = "用户ID") @PathVariable Long userId
    ) {
        List<AiOrderForm> aiOrderForm = aiOrderService.getAiOrderByUserId(userId);
        return Result.success(aiOrderForm);
    }

}
