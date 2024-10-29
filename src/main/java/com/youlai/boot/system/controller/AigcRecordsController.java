package com.youlai.boot.system.controller;

import com.youlai.boot.system.service.AigcRecordsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.youlai.boot.system.model.form.AigcRecordsForm;
import com.youlai.boot.system.model.query.AigcRecordsQuery;
import com.youlai.boot.system.model.vo.AigcRecordsVO;
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

/**
 * 订单前端控制层
 *
 * @author tshy
 * @since 2024-10-23 15:21
 */
@Tag(name = "订单接口")
@RestController
@RequestMapping("/api/v1/aigcRecordss")
@RequiredArgsConstructor
public class AigcRecordsController  {

    private final AigcRecordsService aigcRecordsService;

    @Operation(summary = "订单分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('system:aigcRecords:query')")
    public PageResult<AigcRecordsVO> getAigcRecordsPage(AigcRecordsQuery queryParams ) {
        IPage<AigcRecordsVO> result = aigcRecordsService.getAigcRecordsPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增订单")
    @PostMapping
//    @PreAuthorize("@ss.hasPerm('system:aigcRecords:add')")
    public Result<Void> saveAigcRecords(@RequestBody @Valid AigcRecordsForm formData ) {
        boolean result = aigcRecordsService.saveAigcRecords(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取订单表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('system:aigcRecords:edit')")
    public Result<AigcRecordsForm> getAigcRecordsForm(
        @Parameter(description = "订单ID") @PathVariable Long id
    ) {
        AigcRecordsForm formData = aigcRecordsService.getAigcRecordsFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改订单")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('system:aigcRecords:edit')")
    public Result<Void> updateAigcRecords(
            @Parameter(description = "订单ID") @PathVariable Long id,
            @RequestBody @Validated AigcRecordsForm formData
    ) {
        boolean result = aigcRecordsService.updateAigcRecords(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除订单")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('system:aigcRecords:delete')")
    public Result<Void> deleteAigcRecordss(
        @Parameter(description = "订单ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aigcRecordsService.deleteAigcRecordss(ids);
        return Result.judge(result);
    }


}
