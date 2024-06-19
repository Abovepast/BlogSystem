using BlogSystem.Busi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSystem.html
{
    public partial class blogUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Update(object sender, EventArgs e)
        {
            var en = new BlogBusi();

            var data = new Entity.BlogEntity();
            data.blogTitle = TextBox1.Text;
            data.blogType = TextBox2.Text;
            data.blogRelease = DateTime.Now;
            data.blogAuthor = TextBox3.Text;

            bool flag = en.Update(data);
        }
    }
}