using BlogSystem.Busi;
using BlogSystem.Entity;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlogSystem
{
    public partial class blog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridView.DataSource = GetData("");
                gridView.DataBind();
            }
        }

       private DataTable GetData(string w)
       {
           // 在此处替换为实际数据源
           var en = new BlogBusi();
           var data = en.GetAll(w);

            var dataTable = new DataTable();
            dataTable.Columns.Add("ID");
            dataTable.Columns.Add("文章标题");
           dataTable.Columns.Add("文章分类");
           dataTable.Columns.Add("发布日期");
           dataTable.Columns.Add("博主账号");
            foreach (var row in data)
           {
               var newRow = dataTable.NewRow();

                
                
                newRow["ID"] = row.blogId;
                
                newRow["文章标题"] = row.blogTitle;
               newRow["文章分类"] = row.blogType;
                newRow["发布日期"] = string.Format(" {0:yyyy-MM-dd} ", row.blogRelease);
               newRow["博主账号"] = row.blogAuthor;
               dataTable.Rows.Add(newRow);
           }

           return dataTable;
       }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchValue = searchBox.Text;
            // 在此处执行搜索逻辑并更新GridView的数据源
            gridView.DataSource = GetData(searchValue);
            gridView.DataBind();
        }

        [WebMethod]
        public static string AddBlog(string title, string type, string author)
        {
            // 在这里添加实际的数据库操作逻辑
            // 假设一切顺利，返回"success"
            DateTime date = DateTime.Now;
            var data = new BlogEntity();
            data.blogTitle = title;
            data.blogType = type;
            data.blogRelease = date;
            data.blogAuthor = author;
            var bl = new BlogBusi();
            bool flag = bl.Insert(data);
            if(flag)
            {
                return "success";
            } else
            {
                return "fail";
            }
        }

        [WebMethod]
        public static string UpdateBlog(string id, string title, string type, string release, string author)
        {
            // 在这里添加实际的数据库操作逻辑
            // 假设一切顺利，返回"success"
            DateTime date = DateTime.Parse(release);

            var data = new BlogEntity();
            data.blogId = int.Parse(id);
            data.blogTitle = title;
            data.blogType = type;
            data.blogRelease = date;
            data.blogAuthor = author;
            var bl = new BlogBusi();
            bool flag = bl.Update(data);
            if (flag)
            {
                return "success";
            }
            else
            {
                return "fail";
            }
       }
        //public string DeleteBlog(string id)
        //{
        //    return "DeleteBlog为空方法";
        //}
 

        private void BindGridView()
        {
            gridView.DataSource = GetData("");
            gridView.DataBind();
        }

        //protected void aspDelete_Click(object sender, EventArgs e)
        //{
        //    //var bl = new BlogBusi();
        //    //int id = int.Parse(gridView.SelectedRow.Cells[0].Text);
        //    //if( bl.Delete(id))
        //    //{
        //    //    Info.Text = "删除成功!";
        //    //} else
        //    //{
        //    //    Info.Text = "删除失败!";
        //    //}
            
        //}

        protected void gridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gridView.DataKeys[e.RowIndex].Value.ToString());//获取主键
            var bl = new BlogBusi();
            Label MInfo = (Label)this.Master.FindControl("Info");
            if (bl.Delete(id))
            {
                MInfo.Text = "删除成功!";
            } else
            {
                MInfo.Text = "删除失败!";
            }

            BindGridView();
        }

        //protected void aspDetail_Click(object sender, EventArgs e)
        //{

        //    if (ViewState["SelectedRowId"] != null)
        //    {
        //        int bid = (int)ViewState["SelectedRowId"];
        //        string author = ViewState["SelectedAuthor"].ToString();
        //        string title = ViewState["SelectedTitle"].ToString();
        //        Response.Redirect("ContentPage.aspx?bid=" + bid + "&author=" + author + "&title=" + title);
        //    }
        //    else
        //    {
        //        // 处理未选中行的情况，例如显示错误信息
        //        // Response.Write("<script>alert('请选择一行数据');</script>");
        //    }
            
        //}

        protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 可以在这里进行其他操作
            GridViewRow row = gridView.SelectedRow;
            if (row != null)
            {
                // 行被成功选中，可以在这里进行一些操作
                int bid = int.Parse(row.Cells[0].Text);
                string title = row.Cells[1].Text;
                string type=  row.Cells[2].Text;
                string release = row.Cells[3].Text;
                string author = row.Cells[4].Text;
                

                Response.Redirect("ContentPage.aspx?bid=" + bid + "&title=" + title + "&type=" + type + "&release=" + release + "&author=" + author);
                //// 存储在 ViewState 或其他位置以便在 aspDetail_Click 中使用
                //ViewState["SelectedRowId"] = bid;
                //ViewState["SelectedAuthor"] = author;
                //ViewState["SelectedTitle"] = title;
            }
        }
    }

    public class Row
    {
        public string 文章标题 { get; set; }
        public string 文章分类 { get; set; }
        public string 图片Url { get; set; }
        public DateTime 发布日期 { get; set; }
        public string 博主账号 { get; set; }
    }
}