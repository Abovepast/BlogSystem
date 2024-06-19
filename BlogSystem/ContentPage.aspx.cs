using BlogSystem.Busi;
using BlogSystem.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSystem
{
    public partial class PagePage : System.Web.UI.Page
    {
        public int blogId;
        public string o_Author;
        public string o_Type;
        public string o_Title;
        public string o_Release;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["bid"] != null)
                {
                    blogId = int.Parse(Request.QueryString["bid"]);
                    o_Title = Request.QueryString["title"];
                    o_Type = Request.QueryString["type"];
                    o_Release = Request.QueryString["release"];
                    o_Author = Request.QueryString["author"];
                    bind();
                }
            }
        }

        protected void bind()
        {
            var ar = new BlogBusi();
            BlogEntity en = ar.Get(blogId);

            blogTitle.Text = o_Title;
            blogAuthor.Text = o_Author;
            blogRelease.Text = o_Release;

            if (en == null)
            {
                aContent.Text = "这个人很懒, 什么东西都没写~~";
            } else
            {
                aContent.Text = en.content;
            }
        }

        //提交&修改
        protected void Button1_Click(object sender, EventArgs e)
        {
            var bl = new BlogBusi();
            var en = new BlogEntity();

            en.blogId = int.Parse(Request.QueryString["bid"]);
            en.content = aContent.Text;

            bool flag = bl.UpdateContent(en);
            Label MInfo = (Label)this.Master.FindControl("Info");
            if (flag)
            {
                MInfo.Text = "修改成功!";
            } else
            {
                MInfo.Text = "修改失败!";
            }
        }

        //添加
        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    var ar = new ArticleBusi();
        //    var en = new ArticleEntity();
        //    en.content = aContent.Text;
        //    en.blogId = blogId;

        //    bool flag = ar.Insert(en);
        //    Label MInfo = (Label)this.Master.FindControl("Info");
        //    if (flag)
        //    {
        //        MInfo.Text = "添加成功!";
        //    }
        //    else
        //    {
        //        MInfo.Text = "添加失败!";
        //    }
        //}
    }
}