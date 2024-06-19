<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blogAdd.aspx.cs" Inherits="BlogSystem.html.blogAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="../layui/css/layui.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="layui-form-item" style="margin:20px;margin-left:-40px;">
                <label class="layui-form-label">标题:</label>
                <div class="layui-input-block">
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="请输入" CssClass="layui-input"></asp:TextBox>
                </div>
                <label class="layui-form-label">类型:</label>
                <div class="layui-input-block">
                   <asp:TextBox ID="TextBox2" runat="server" placeholder="请输入" CssClass="layui-input"></asp:TextBox>
                </div>
                <label class="layui-form-label">作者:</label>
                <div class="layui-input-block">
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="请输入" CssClass="layui-input"></asp:TextBox>
                </div>

                <div class="layui-input-block" align="center" style="margin-left:-20px;">
                    <asp:Button ID="Button1" CssClass="layui-btn" runat="server" Text="添加" OnClick="Add" />
                </div>
            </div>
            <script src="../layui/layui.js"></script>
        </div>
    </form>
</body>
</html>
