package com.youlai.boot.system.controller;

import com.youlai.boot.system.service.TbUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.youlai.boot.system.model.form.TbUserForm;
import com.youlai.boot.system.model.query.TbUserQuery;
import com.youlai.boot.system.model.vo.TbUserVO;
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
 * 普通用户，存储用户的基本信息和父子级关系前端控制层
 *
 * @author tshy
 * @since 2024-10-23 03:33
 */
@Tag(name = "普通用户，存储用户的基本信息和父子级关系接口")
@RestController
@RequestMapping("/api/v1/tbUsers")
@RequiredArgsConstructor
public class TbUserController  {

    private final TbUserService tbUserService;

    @Operation(summary = "普通用户，存储用户的基本信息和父子级关系分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('system:tbUser:query')")
    public PageResult<TbUserVO> getTbUserPage(TbUserQuery queryParams ) {
        IPage<TbUserVO> result = tbUserService.getTbUserPage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增普通用户，存储用户的基本信息和父子级关系")
    @PostMapping
//    @PreAuthorize("@ss.hasPerm('system:tbUser:add')")
    public Result<Void> saveTbUser(@RequestBody @Valid TbUserForm formData ) {
        boolean result = tbUserService.saveTbUser(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取普通用户，存储用户的基本信息和父子级关系表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('system:tbUser:edit')")
    public Result<TbUserForm> getTbUserForm(
        @Parameter(description = "普通用户，存储用户的基本信息和父子级关系ID") @PathVariable Long id
    ) {
        TbUserForm formData = tbUserService.getTbUserFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改普通用户，存储用户的基本信息和父子级关系")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('system:tbUser:edit')")
    public Result<Void> updateTbUser(
            @Parameter(description = "普通用户，存储用户的基本信息和父子级关系ID") @PathVariable Long id,
            @RequestBody @Validated TbUserForm formData
    ) {
        boolean result = tbUserService.updateTbUser(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除普通用户，存储用户的基本信息和父子级关系")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('system:tbUser:delete')")
    public Result<Void> deleteTbUsers(
        @Parameter(description = "普通用户，存储用户的基本信息和父子级关系ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = tbUserService.deleteTbUsers(ids);
        return Result.judge(result);
    }

}
