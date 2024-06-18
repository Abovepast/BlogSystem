<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="BlogSystem.home" %>

@{
    ViewData["Title"] = "管理员中心";
}

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	</head>
	<body>
		
		<div class="layui-layout layui-layout-admin">
		  <div class="layui-header">
		    <div class="layui-logo layui-hide-xs layui-bg-black">BlogSystem</div>
		    <!-- 头部区域（可配合layui 已有的水平导航） -->
		    <ul class="layui-nav layui-layout-left">
		      <!-- 移动端显示 -->
		      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
		        <i class="layui-icon layui-icon-spread-left"></i>
		      </li>
		      <li class="layui-nav-item layui-hide-xs"><a href="javascript:;">导航 1</a></li>
		      <li class="layui-nav-item layui-hide-xs"><a href="javascript:;">导航 2</a></li>
		      <li class="layui-nav-item layui-hide-xs"><a href="javascript:;">导航 3</a></li>
		      <li class="layui-nav-item">
		        <a href="javascript:;">iKun</a>
		        <dl class="layui-nav-child">
		          <dd><a href="javascript:;">唱</a></dd>
		          <dd><a href="javascript:;">跳</a></dd>
		          <dd><a href="javascript:;">篮球</a></dd>
		        </dl>
		      </li>
		    </ul>
		    <ul class="layui-nav layui-layout-right">
		      <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
		        <a href="javascript:;">
		          <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">
		          admin
		        </a>
		        <dl class="layui-nav-child">
		          <dd><a href="javascript:;">个人资料</a></dd>
		          <dd><a href="javascript:;">设置</a></dd>
		          <dd><a href="javascript:;">退出登录</a></dd>
		        </dl>
		      </li>
		      <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
		        <a href="javascript:;">
		          <i class="layui-icon layui-icon-more-vertical"></i>
		        </a>
		      </li>
		    </ul>
		  </div>
		  <div class="layui-side layui-bg-black">
		    <div class="layui-side-scroll">
		      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
		      <ul class="layui-nav layui-nav-tree" lay-filter="test">
				<li class="layui-nav-item"><a href="javascript:;">仪表盘</a></li>
		        <li class="layui-nav-item layui-nav-itemed">
		          <a class="" href="javascript:;">内容</a>
		          <dl class="layui-nav-child">
		            <dd><a href="javascript:;">博客文章管理</a></dd>
		            <dd><a href="javascript:;">页面管理</a></dd>
		            <dd><a href="javascript:;">评论管理</a></dd>
		          </dl>
		        </li>
				<li class="layui-nav-item layui-nav-itemed">
				  <a class="" href="javascript:;">用户</a>
				  <dl class="layui-nav-child">
				    <dd><a href="javascript:;">管理员</a></dd>
				    <dd><a href="javascript:;">博主</a></dd>
				  </dl>
				</li>
				<li class="layui-nav-item layui-nav-itemed">
				  <a class="" href="javascript:;">系统</a>
				  <dl class="layui-nav-child">
				    <dd><a href="javascript:;">设置</a></dd>
				    <dd><a href="javascript:;">附件</a></dd>
					<dd><a href="javascript:;">备份</a></dd>
				  </dl>
				</li>
		        <li class="layui-nav-item"><a href="javascript:;">关于</a></li>
		      </ul>
		    </div>
		  </div>
		  <div class="layui-body">
		    <!-- 内容主体区域 -->
		    <div style="padding: 15px;">
		      <blockquote class="layui-elem-quote layui-text">
		        Layui 框体布局内容主体区域
		      </blockquote>
		      <div class="layui-card layui-panel">
		        <div class="layui-card-header">
		          下面是充数内容，为的是出现滚动条
		        </div>
		        <div class="layui-card-body">
		        充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>充数内容<br>你还真滑到了底部呀
		        </div>
		      </div>
		      <br><br>
		    </div>
		  </div>
		  <div class="layui-footer">
		    <!-- 底部固定区域 -->
		    Powered by Shijin Wang
		  </div>
		</div>
		 
		<script src="layui/layui.js"></script>
		<script>
            //JS 
            layui.use(['element', 'layer', 'util'], function () {
                var element = layui.element;
                var layer = layui.layer;
                var util = layui.util;
                var $ = layui.$;

                //头部事件
                util.event('lay-header-event', {
                    menuLeft: function (othis) { // 左侧菜单事件
                        layer.msg('展开左侧菜单的操作', { icon: 0 });
                    },
                    menuRight: function () {  // 右侧菜单事件
                        layer.open({
                            type: 1,
                            title: '更多',
                            content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
                            area: ['260px', '100%'],
                            offset: 'rt', // 右上角
                            anim: 'slideLeft', // 从右侧抽屉滑出
                            shadeClose: true,
                            scrollbar: false
                        });
                    }
                });
            });
        </script>
	</body>
</html>