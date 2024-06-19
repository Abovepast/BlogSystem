<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testUpdate.aspx.cs" Inherits="BlogSystem.html.testUpdate" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>子页面</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    
    <style>
        .marTop {
            margin-top: 40px;
            margin-left: -40px;
            padding: 20px;
        }
    </style>
    <script src="../layui/layui.js"></script>
</head>
<body>

    <div id="message"></div>
    <form runat="server" name="from">
    <div class="layui-row marTop" name="lrow">
        <div class="layui-col-xs6">
            <div class="layui-form-item">
                <label class="layui-form-label">ID</label>
                <div class="layui-input-block">
                    <asp:TextBox ID="blogId" runat="server" autocomplete="off" CssClass="layui-input" 
                        disabled="disabled" Text="">1</asp:TextBox>
                    <%--<input type="text" id="blogId" lay-verify="required" autocomplete="off"
                        class="layui-input" disabled="disabled">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <asp:TextBox ID="blogTitle" CssClass="layui-input" placeholder="请输入标题" runat="server"></asp:TextBox>
                    <%--<input type="text" id="blogTitle" lay-verify="required" placeholder="请输入标题" autocomplete="off"
                        class="layui-input">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-block">
                    <asp:TextBox ID="blogType" CssClass="layui-input" placeholder="请输入类型" runat="server"></asp:TextBox>
                    <%--<input type="text" id="blogType" placeholder="请输入类型" autocomplete="off" class="layui-input">--%>
                </div>
            </div>
            <!--<div class="layui-form-item">
            <label class="layui-form-label">发布时间</label>
            <div class="layui-input-block">-->
            <!-- 使用lay-date组件作为日期选择器 -->
            <!--<input type="text" id="blogRelease" placeholder="请选择发布时间" class="layui-input">
            </div>
        </div>-->

        </div>
        <div class="layui-col-xs6">
            <div class="layui-form-item">
                <label class="layui-form-label">作者</label>
                <div class="layui-input-block">
                    <asp:TextBox ID="blogAuthor" CssClass="layui-input" placeholder="请输入作者" runat="server"></asp:TextBox>
                    <%--<input type="text" id="blogAuthor" lay-verify="required" placeholder="请输入作者" autocomplete="off"
                        class="layui-input">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发布时间</label>
                <div class="layui-input-block">
                    <%--<asp:Calendar ID="blogRelease" runat="server" placeholder="yyyy-MM-dd"></asp:Calendar>--%>
                    <input type="text" class="layui-input" id="blogRelease" placeholder="yyyy-MM-dd">
                </div>
            </div>

            <%--<div class="layui-input-block">
                <button type="button" class="layui-btn" id="submitButton" layon="bbt">提交</button>
            </div>--%>
        </div>
    </div>
        </form>
    <script src="//cdn.staticfile.org/jquery/1.12.3/jquery.min.js"></script>
    <script>
        function setParentValue(value) {
            // 接收父页面传递的参数
            document.getElementById('blogId').value = value;

            //$.ajax({
            //    type: "POST",
            //    url: "testUpdate.aspx/ajax_bind",
            //    data: JSON.stringify({ id: value }),
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "text"
            //});
        }

        layui.use('layer', function () {
            var layer = layui.layer;
            var laydate = layui.laydate;
            // 渲染
            laydate.render({
                elem: '#blogRelease'
            });
        });

    </script>

</body>
</html>

