<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="BlogSystem.dashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <title>仪表盘</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style>
        .content {
            padding: 20px;
        }
        .layui-card {
            margin-bottom: 20px;
        }
        .layui-card-body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100px;
            font-size: 24px;
        }
        .quick-access {
            display: flex;
            flex-wrap: wrap;
        }
        .quick-access .layui-col-md3 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
                <div class="layui-logo">Halo</div>
            </div>
            <div class="layui-side layui-bg-black">
                <div class="layui-side-scroll">
                    <ul class="layui-nav layui-nav-tree" lay-filter="test">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a class="" href="javascript:;">仪表盘</a>
                        </li>
                        <li class="layui-nav-item">
                            <a href="javascript:;">内容</a>
                            <dl class="layui-nav-child">
                                <dd><a href="">文章</a></dd>
                                <dd><a href="">页面</a></dd>
                                <dd><a href="">评论</a></dd>
                                <dd><a href="">附件</a></dd>
                            </dl>
                        </li>
                        <li class="layui-nav-item"><a href="">外观</a></li>
                        <li class="layui-nav-item"><a href="">系统</a></li>
                    </ul>
                </div>
            </div>
            <div class="layui-body">
                <div class="content">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md3">
                            <div class="layui-card">
                                <div class="layui-card-header">文章</div>
                                <div class="layui-card-body">3</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-card">
                                <div class="layui-card-header">用户</div>
                                <div class="layui-card-body">1</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-card">
                                <div class="layui-card-header">评论</div>
                                <div class="layui-card-body">0</div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-card">
                                <div class="layui-card-header">浏览量</div>
                                <div class="layui-card-body">40</div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-row">
                        <div class="layui-col-md9">
                            <div class="quick-access">
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">个人中心</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">查看站点</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">创建文章</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">创建页面</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">附件上传</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">主题管理</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">插件管理</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">新建用户</div>
                                    </div>
                                </div>
                                <div class="layui-col-md3">
                                    <div class="layui-card">
                                        <div class="layui-card-header">刷新搜索引擎</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md3">
                            <div class="layui-card">
                                <div class="layui-card-header">通知</div>
                                <div class="layui-card-body">
                                    <div class="empty-message">
                                        <p>当前没有未读的消息</p>
                                        <button class="layui-btn layui-btn-primary layui-btn-sm">刷新</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-footer">
                Powered by Halo Pro
            </div>
        </div>
    </form>
    <script>
        layui.use(['element', 'form'], function () {
            var element = layui.element;
            var form = layui.form;
        });
    </script>
</body>
</html>
