using BlogSystem.Busi;
using BlogSystem.Entity;
using BlogSystem.Inter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSystem
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButSubmit_Click(object sender, EventArgs e)
        {
            var name = txtUserName.Text.Trim();
            var pwd = txtUserPwd.Text.Trim();

            var entity = new SysUserEntity();
            entity.UserName = name;
            entity.UserPwd = pwd;

            ISysUser bll = new SysUserBusi();
            var flags = bll.CheckLogin(entity);
            if (flags)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('登录成功!')</script>");
                Response.Redirect("home.aspx");
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('登录失败!')</script>");
            /*if (loginSuccessful)
            {
                Response.Redirect("主页.aspx");
            }*/
        }

        [WebMethod]
        public static object Login(string username, string password)
        {
            // 这里应该是验证用户名和密码的逻辑
            // 示例代码仅做示意，实际应使用数据库验证等方法
            if (username == "admin" && password == "password")
            {
                // 登录成功，可以设置 Session 或 Cookie 等
                return new { success = true, msg = "登录成功" };
            }
            else
            {
                return new { success = false, msg = "用户名或密码错误" };
            }
        }

        /*protected void butSubmit_Click(object sender, EventArgs e)
        {
            var name = txtUserName.Text.Trim();
            var pwd = txtUserPwd.Text.Trim();

            var entity = new SysUserEntity();
            entity.UserName = name;
            entity.UserPwd = pwd;

            ISysUser bll = new SysUserBusi();
            var flags = bll.Insert(entity);
            if (flags)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('保存成功!')</script>");
                return;
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('保存失败!')</script>");

        }*/
    }
}