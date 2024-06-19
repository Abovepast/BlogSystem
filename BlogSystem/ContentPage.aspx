<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContentPage.aspx.cs" Inherits="BlogSystem.PagePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
			<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<style>
		.marTop {
		    margin-top: 40px;
			margin-left:-40px;
		    padding: 20px;
			margin-right:-20px;
		}
		.height{
			height: 360px;
		}
		.width{
			width: 100px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

		
		
		<div class="layui-container">
			<div class="layui-row">
				<div class="layui-col-md10 layui-col-md-offset1 marTop">
					<div class="layui-form-item">
					    <label class="layui-form-label">作者:</label>
					    <div class="layui-input-block">
							<asp:TextBox ID="blogAuthor" runat="server" CssClass="layui-input" ReadOnly="true"></asp:TextBox>
					        <%--<input type="text" id="blogAuthor" lay-verify="required" autocomplete="off"
					               class="layui-input">--%>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">发布时间:</label>
                        <div class="layui-input-block">
                            <asp:TextBox ID="blogRelease" runat="server" CssClass="layui-input" ReadOnly="true"></asp:TextBox>
                            <%--<input type="text" id="blogAuthor" lay-verify="required" autocomplete="off"
               class="layui-input">--%>
                        </div>
                    </div>
					<div class="layui-form-item">
					    <label class="layui-form-label">标题:</label>
					    <div class="layui-input-block">
							<asp:TextBox ID="blogTitle" runat="server" CssClass="layui-input" ReadOnly="true"></asp:TextBox>
					        <%--<input type="text" id="blogTitle" lay-verify="required" autocomplete="off"
					               class="layui-input">--%>
					    </div>
					</div>
					<div class="layui-form-item">
					    <label class="layui-form-label">文本域:</label>
					    <div class="layui-input-block">
							<asp:TextBox ID="aContent" runat="server" CssClass="layui-textarea height" TextMode="MultiLine"></asp:TextBox>
					        <%--<textarea name="" id="aContent" placeholder="多行文本框" class="layui-textarea" style="height: 400px;"></textarea>--%>
					    </div>
					</div>
					 <%--align="center"--%> 
					<div class="layui-form-item" align="center">
						<asp:Button ID="Button1" OnClick="Button1_Click" CssClass="layui-btn layui-btn-fluid width" runat="server" Text="确定" />
						<%--<asp:Button ID="Button2" OnClick="Button2_Click" CssClass="layui-btn layui-btn-fluid layui-bg-blue width" runat="server" Text="添加" />--%>

<%--						<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-login" style="width: 80px;" >确定</button>
						<button class="layui-btn layui-btn-fluid layui-bg-blue" lay-submit lay-filter="demo-login" style="width: 80px;">添加</button>--%>
					</div>
				</div>
				
			</div>
			
		</div>
		
		<script src="layui/layui.js"></script>
</asp:Content>
