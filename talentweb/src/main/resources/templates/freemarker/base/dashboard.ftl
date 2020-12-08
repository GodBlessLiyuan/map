<!--**********************************
    Sidebar start
***********************************-->
<div class="nk-sidebar">
    <div class="nk-nav-scroll">
        <ul class="metismenu" id="menu">

            <li><a href="./main"><i class="main_icon tab_icon"></i><span class="nav-text" style="vertical-align: middle;">首页</span></a></li>

            <#if userAuthority.role_query == 2 || userAuthority.user_query == 2 || userAuthority.log_query == 2>
                <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="system_icon tab_icon"></i><span class="nav-text" style="vertical-align: middle;">系统管理</span></a>
                    <ul aria-expanded="false">
                        <#if userAuthority.role_query == 2>
                            <li><a href="manageRole">角色管理</a></li>
                        </#if>
                        <#if userAuthority.user_query == 2>
                            <li><a href="manageUser">用户管理</a></li>
                        </#if>
                        <#if userAuthority.log_query == 2>
                            <li><a href="manageLog">操作日志</a></li>
                        </#if>
                    </ul>
                </li>
            </#if>

            <#if userAuthority.general_query == 2 || userAuthority.show_query == 2>
                <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="member_icon tab_icon"></i><span class="nav-text" style="vertical-align: middle;">乡贤管理</span></a>
                    <ul aria-expanded="false">
                        <#if userAuthority.general_query == 2>
                            <li><a href="talentgeneral">乡贤人才</a></li>
                        </#if>
                        <#if userAuthority.show_query == 2>
                            <li><a href="talentfamous">展示配置</a></li>
                        </#if>
                    </ul>
                </li>
            </#if>

            <#if userAuthority.video_query == 2>
                <li><a href="configVideo" aria-expanded="false"><i class="video_icon tab_icon"></i><span class="nav-text" style="vertical-align: middle;">视频配置</span></a></li>
            </#if>
        </ul>
    </div>
</div>
<!--**********************************
    Sidebar end
***********************************-->
