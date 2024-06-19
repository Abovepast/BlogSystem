<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContentBlog.aspx.cs" Inherits="BlogSystem.blog"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .marBottom{
            margin-bottom:30px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md4">
                <asp:Panel runat="server" CssClass="layui-input-wrap">
                    <asp:Label runat="server" AssociatedControlID="searchBox" CssClass="layui-input-prefix">
                        <i class="layui-icon layui-icon-username"></i>
                    </asp:Label>
                    <asp:TextBox ID="searchBox" runat="server" Text="" placeholder="博客标题" CssClass="layui-input" />
                </asp:Panel>
            </div>
            <div class="layui-col-md2 layui-btn-container layui-col-xs12">
                <asp:Button ID="searchButton" CssClass="layui-btn lay-submit" runat="server" Text="搜索" OnClick="SearchButton_Click" />
                <button type="button" class="layui-btn layui-btn-primary" lay-on="test-iframe-handle">添加</button>
            </div>
            
        </div>
        
        <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="false" CssClass="layui-table marBottom" 
            DataKeyNames="ID"  OnRowDeleting="gridView_RowDeleting" OnSelectedIndexChanged="gridView_SelectedIndexChanged">
            <Columns>
                <%--<asp:TemplateField HeaderText="索引">
                    <ItemTemplate>
                        <asp:CheckBox ID="checkBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="文章标题" HeaderText="文章标题" />
                <asp:BoundField DataField="文章分类" HeaderText="文章分类" />
                <asp:BoundField DataField="发布日期" HeaderText="发布日期" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="博主账号" HeaderText="博主账号" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:Button ID="aspDetail" runat="server" CommandName="Select" Text="详情" CssClass="layui-btn layui-btn-xs" />
                        <%--<button type="button" class="layui-btn layui-btn-xs" lay-on="detail">详情</button>--%>
                        <%--<button type="button" class="layui-btn layui-btn-xs layui-bg-blue"lay-on="layUpdate">修改</button>--%>
                        <%--<asp:Button ID="Button1" runat="server" Text="修改" OnClientClick="return openAddPage(_titel, data);" CssClass="layui-btn layui-btn-xs layui-bg-blue" />--%>
                        <%--<asp:Button ID="Button1" runat="server" Text="修改" OnClientClick="return openChildPage();" CssClass="layui-btn layui-btn-xs layui-bg-blue" />--%>

                        <asp:Button ID="aspUpdate" runat="server" Text="修改" OnClientClick="return getID(this);" CssClass="layui-btn layui-btn-xs layui-bg-blue" />
                        <%--<asp:Button ID="aspUpdate" runat="server" Text="修改" OnClick="aspUpdate_Click" />--%>
                        <%--<button type="button" class="layui-btn layui-btn-xs layui-bg-red" lay-on="web-delete">删除</button>--%>

                        <%--确认弹窗--%>
                        <%--OnClientClick='<%#  "if (!confirm(\"你确定要删除" + Eval("Id").ToString() + "吗?\")) return false;"%>'--%>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="删除" CssClass="layui-btn layui-btn-xs layui-bg-red" ></asp:LinkButton>
                        <%--<asp:Button ID="Button1" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' CssClass="layui-btn layui-btn-xs layui-bg-red" />--%>
                        <%--<asp:Button ID="aspDelete" runat="server" Text="删除" OnClick="aspDelete_Click" CssClass="layui-btn layui-btn-xs layui-bg-red"/>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <script src="layui/layui.js"></script>
    <script>


        function getID(button) {
            // 获取按钮所在的当前行
            var currentRow = button.closest('tr');
            // 获取ID列的值
            var idValue = currentRow.cells[0].innerText;
            var titleValue = currentRow.cells[1].innerText;
            var typeValue = currentRow.cells[2].innerText;
            var releaseValue = currentRow.cells[3].innerText;
            var authorValue = currentRow.cells[4].innerText;

            //alert("ID值是: " + idValue);
            // 修改
            layui.use(function () {
                var $ = layui.$;
                var layer = layui.layer;
                layer.open({
                    type: 2,
                    area: ['680px', '450px'],
                    content: 'html/testUpdate.aspx',
                    success: function (layero, index) {
                        // 通过iframe对象传递参数
                        var iframeWindow = window[layero.find('iframe')[0]['name']];
                        iframeWindow.setParentValue(idValue);
                        //设置原始数据
                        var body = layui.layer.getChildFrame('body', index);
                        body.find("#blogTitle").val(titleValue);
                        body.find("#blogType").val(typeValue);
                        body.find("#blogAuthor").val(authorValue);
                        body.find("#blogRelease").val(releaseValue);
                    },
                    btn: ['确定', '取消'],
                    yes: function (index, layero) {
                        // 获取 iframe 的窗口对象
                        var iframeWin = window[layero.find('iframe')[0]['name']];
                        // 回获更新后的数据
                        var title = iframeWin.$('#blogTitle').val();
                        var type = iframeWin.$('#blogType').val();
                        var release = iframeWin.$('#blogRelease').val();
                        var author = iframeWin.$('#blogAuthor').val();

                        // 显示获得的值
                        //layer.msg('AAAA：' + idValue + 'title:' + title + '\ntype:' + type + '\nrelease:' + release + '\nauthor:' + author);
                        $.ajax({
                            type: "POST",
                            url: "ContentBlog.aspx/UpdateBlog",
                            data: JSON.stringify({ id: idValue, title: title, type: type, release: release, author: author }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                if (response.d === "success") {
                                    layer.msg('修改成功!');
                                } else {
                                    //alert("Failed to add blog.");
                                    layer.msg('修改失败!')
                                }
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert('Error: ' + xhr.status);
                            }
                        });
                        
                    },
                    end: function () {
                        window.location.reload(); // 在弹出层关闭后刷新父页面
                    }
                });
            });
            

            // 继续进行其他操作
            return false;
        }

        layui.use(function () {
            var $ = layui.$;
            var layer = layui.layer;
            var util = layui.util;
            // 事件
            util.on('lay-on', {
                'test-iframe-handle': function () {
                    layer.open({
                        type: 2,
                        area: ['680px', '450px'],
                        content: 'html/layAdd.html',
                        fixed: false, // 不固定
                        maxmin: true,
                        shadeClose: true,
                        btn: ['确定', '取消'],
                        btnAlign: 'c',
                        yes: function (index, layero) {
                            // 获取 iframe 的窗口对象
                            var iframeWin = window[layero.find('iframe')[0]['name']];

                            var title = iframeWin.$('#blogTitle').val();
                            var type = iframeWin.$('#blogType').val();
                            //var release = iframeWin.$('#blogRelease').val();
                            var author = iframeWin.$('#blogAuthor').val();

                            // 显示获得的值
                            //layer.msg('AAAA：title:' + title + '\ntype:' + type + '\nrelease:' + release + '\nauthor:' + author);

                            $.ajax({
                                type: "POST",
                                url: "ContentBlog.aspx/AddBlog",
                                data: JSON.stringify({ title: title, type: type, author: author }),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    if (response.d === "success") {
                                        layer.msg('添加成功!');
                                    } else {
                                        //alert("Failed to add blog.");
                                        layer.msg('添加失败!')
                                    }
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert('Error: ' + xhr.status);
                                }
                            });
                        },
                        end: function () {
                            window.location.reload(); // 在弹出层关闭后刷新父页面
                        }
                    });      
                }
                //, 'layUpdate': function () {
                //    //var bid = gridview.rows[Index].cells[0].innerHTML;
                //    layer.msg('获取ID成功:');
                    
                //}
            })

            
        });
    </script>
</asp:Content>
