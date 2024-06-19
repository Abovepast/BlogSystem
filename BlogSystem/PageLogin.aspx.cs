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
                Response.Redirect("ContentBlog.aspx");
            }
            Page.ClientScript.RegisterStartupScript(GetType(), "js", "<script>alert('登录失败!')</script>");
        }
    }
}