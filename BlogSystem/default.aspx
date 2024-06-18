<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="BlogSystem._default" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>博客系统登录</title>
    <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
    <form id="loginForm" runat="server" class="layui-form layui-card layui-form-pane" action="default.aspx/Login" method="post">
        <div class="layui-row" style="padding: 32px;">
            <div class="layui-col-md4 layui-col-md-offset4 layui-panel" style="height: 350px">
                <div class="layui-card-header">
                    <h2>博客系统登录</h2>
                </div>
                <div class="layui-card-body">
                    <div class="layui-form-item">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="txtUserName" runat="server" Text="admin" class="layui-input"></asp:TextBox>
                            <%--<input type="text" name="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">--%>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password" class="layui-input"></asp:TextBox>
                            <%--<input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">--%>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">身份</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sex" value="管理员" title="管理员" checked>
                            <input type="radio" name="sex" value="用户" title="用户">
                            <input type="radio" name="sex" value="用户" title="用a">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单行选择框</label>
                        <div class="layui-input-block">
                            <asp:DropDownList ID="ddlRole" runat="server">
                                <asp:ListItem Value="管理员">管理员</asp:ListItem>
                                <asp:ListItem Value="博主">博主</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="layui-form-item" align="center" >
                        <asp:Button CssClass="layui-btn" ID="ButSubmit" runat="server" Text="登录" OnClick="ButSubmit_Click" />
                        <%--<button class="layui-btn" lay-submit lay-filter="login">登录</button>--%>
                    </div>
                </div>
            </div>
        </div>



        <%--<asp:Label ID="lblUserName" AssociatedControlID="txtUserName" runat="server" Text="用户名:" />--%>
        <%--<asp:TextBox ID="a1" runat="server" Text="admin" class="layui-input"></asp:TextBox>--%>

        <%--<asp:Label ID="lblPassword" AssociatedControlID="txtUserPwd" runat="server" Text="密码:" />--%>
        <%--<asp:TextBox ID="txtUserPwd" runat="server" Text="..." TextMode="Password"></asp:TextBox>--%>

        <%--<asp:Label ID="lblRole" AssociatedControlID="ddlRole" runat="server" Text="角色:" />
        <asp:DropDownList ID="ddlRole" runat="server">
            <asp:ListItem Value="管理员">管理员</asp:ListItem>
            <asp:ListItem Value="博主">博主</asp:ListItem>
        </asp:DropDownList>--%>

        
    </form>
    <div id="form1" runat="server">
        <script>
            // 这里可以添加一些简单的JavaScript代码来处理表单提交等操作。
            // 在实际项目中，你可能需要将表单数据发送到服务器进行验证并返回响应。
            layui.use('form', function () {
                var form = layui.form;

                // 监听提交
                form.on('submit(login)', function (data) {
                    // 这里可以执行 AJAX 请求提交数据到服务器
                    // data.field 包含了提交的数据
                    $.ajax({
                        url: "default.aspx/Login",
                        type: "POST",
                        data: data.field,
                        success: function (res) {
                            if (res.success) {
                                // 登录成功处理
                                alert("登录成功！");
                                Response.Redirect("home.aspx");
                            } else {
                                // 登录失败处理
                                alert("登录失败：" + res.msg);
                            }
                        },
                        error: function () {
                            alert("请求出错，请检查网络连接。");
                        }
                    });

                    return false; // 阻止表单默认提交行为
                });
            });
        </script>
    </div>
</body>
</html>
