layui.use(['layer', 'form'], function () {
    var layer = layui.layer;
    var form = layui.form;

    // 触发添加博客按钮事件
    $("#addBlogBtn").click(function () {
        // 清空表单（如果之前有填写过）
        form.val("blogForm", {});

        // 显示弹出层
        layer.open({
            type: 1,
            title: '添加博客',
            content: $('#blogForm'), // 这里content是一个DOM对象，用于放置表单
            area: ['500px', '300px'],
            btn: ['确定', '取消'],
            yes: function (index, layero) {
                // 确定按钮点击事件
                // 获取表单数据
                var data = form.val('blogForm');
                // 自动添加发布时间（这里简单示例，实际应为服务器时间）
                data.publishTime = new Date().toLocaleString();

                // 提交数据到服务器，这里使用Ajax模拟
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/AddBlog",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == "success") {
                            layer.msg('添加成功！');
                            layer.close(index); // 关闭弹出层
                        } else {
                            layer.msg('添加失败！');
                        }
                    },
                    error: function () {
                        layer.msg('请求出错！');
                    }
                });
            }
        });
    });

    // 初始化表单结构（在layui.use的回调里执行）
    form.render();
});