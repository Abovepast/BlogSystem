using BlogSystem.Busi;
using BlogSystem.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSystem.html
{
    public partial class testUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //bind();
            }
        }

        //protected void bind()
        //{
        //    if (blogId.ClientID == "")
        //    {
        //        return;
        //    }
        //    int id = int.Parse(blogId.Text);

        //    var bl = new BlogBusi();
        //    var en = new BlogEntity();
        //    en = bl.Get(id);
        //    blogTitle.Text = en.blogTitle;
        //    blogType.Text = en.blogType;
        //    blogAuthor.Text = en.blogAuthor;
        //    blogRelease.SelectedDate = en.blogRelease;
        //}

        //public void ajax_bind(string id)
        //{
        //    blogId.Text = id;
        //    bind();
        //}
    }
}