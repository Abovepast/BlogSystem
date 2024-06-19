<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageLogin.aspx.cs" Inherits="BlogSystem._default" %>

<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="layui/css/layui.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>登录页</title>
  <style>

    .login-form {
      width: 300px;
      margin: 20vh auto;
      padding: 20px;
      border-radius: 6px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      background-color: white;
    }

    input[type=text],
    input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    button {
      background-color: #4CAF50;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
      border-radius: 4px;
    }

    select {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    .role-labels {
      font-size: 14px;
      margin-bottom: 10px;
    }

    .role-label {
      display: inline-block;
      margin-right: 10px;
    }
  </style>
</head>

<body>

    <form id="form1" runat="server">

  <div class="login-form">
    <h2>博客系统登录</h2>
    <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUserName" Text="用户名:" />

      <asp:TextBox ID="txtUserName" runat="server" CssClass="layui-input"></asp:TextBox>

    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtUserPwd" Text="密码:" />
    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password" CssClass="layui-input"></asp:TextBox>

    <asp:Button ID="btnLogin" runat="server" OnClick="ButSubmit_Click" Text="登录" CssClass="layui-btn layui-btn-fluid" />
  </div>

  <script>
    // 这里可以添加一些简单的JavaScript代码来处理表单提交等操作。
    // 在实际项目中，你可能需要将表单数据发送到服务器进行验证并返回响应。
  </script>
    </form>
</body>

</html>
