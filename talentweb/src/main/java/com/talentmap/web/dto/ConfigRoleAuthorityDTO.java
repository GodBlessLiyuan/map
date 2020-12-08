package com.talentmap.web.dto;

import lombok.Data;

/**
 * @Author：dangyi
 * @Date: Created in 2020/2/27 13:46
 * @Description: 配置角色权限：系统管理
 */
@Data
public class ConfigRoleAuthorityDTO {

    private Long roleId;

    /**
     * 权限：1关闭   2开放
     */
    /**
     * 角色权限
     */
    private byte role_query;
    private byte role_create;
    private byte role_update;
    private byte role_delete;

    /**
     * 用户权限
     */
    private byte user_query;
    private byte user_create;
    private byte user_update;
    private byte user_delete;

    /**
     * 日志权限
     */
    private byte log_query;
    private byte log_download;

    /**
     * 一般乡贤权限
     */
    private byte general_query;
    private byte general_single;
    private byte general_batch;
    private byte general_export;
    private byte general_update;
    private byte general_delete;

    /**
     * 重点乡贤权限
     */
    private byte major_query;
    private byte major_single;
    private byte major_batch;
    private byte major_export;
    private byte major_update;
    private byte major_delete;

    /**
     * 展示配置权限
     */
    private byte show_query;
    private byte show_create;
    private byte show_update;
    private byte show_delete;
    private byte show_sort;

    /**
     * 视频配置权限
     */
    private byte video_query;
    private byte video_upload;
}
