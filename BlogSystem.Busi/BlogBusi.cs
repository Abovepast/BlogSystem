using BlogSystem.Data;
using BlogSystem.Entity;
using BlogSystem.Inter;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogSystem.Busi
{
    public class BlogBusi : IBlog
    {
        public bool Delete(int id)
        {
            var sql = "delete from blog where blogId = @id";
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@id",id)
            };
            return DataAccess.ExecuteSql(sql, parms) > 0;
        }

        public BlogEntity Get(int id)
        {
            var sql = "select * from blog where blogId = @id";
            var dt = DataAccess.ExecuteQuery(sql, new MySqlParameter[] { new MySqlParameter("@id", id) });
            if(dt?.Rows.Count > 0)
            {
                return Convert(dt.Rows[0]);
            }
            return null;

        }

        public BlogEntity Convert(DataRow dr)
        {
            var en = new BlogEntity();
            en.blogId = int.Parse(dr["blogId"].ToString());
            en.blogTitle = dr["blogTitle"].ToString();
            en.blogType = dr["blogType"].ToString();
            en.blogRelease = DateTime.Parse(dr["blogRelease"].ToString());
            en.blogAuthor = dr["blogAuthor"].ToString();
            en.content = dr["content"].ToString();
            return en;
        }

        public List<BlogEntity> GetAll(string w)
        {
            var sql = "select * from Blog WHERE blogTitle LIKE CONCAT('%', @str, '%')";
            
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@str", w)
            };
            var dt = DataAccess.ExecuteQuery(sql, parms);
            var list = new List<BlogEntity>();
            foreach (DataRow dr in dt.Rows)
            {
                var en = Convert(dr);
                list.Add(en);
            }
            return list;
        }

        //public List<BlogEntity> GetAllLink(string w)
        //{
        //    //var sql = "select (blogId) from Blog WHERE blogTitle LIKE CONCAT('%', @str, '%')";
        //    var sql = "SELECT blog.blogId, blog.blogTitle, blog.blogType, blog.blogRelease, sysUser.username " +
        //        "FROM blog INNER JOIN sysUser ON blog.id = sysUser.id " +
        //        "where blogTitle LIKE CONCAT('%','@str','%')";
        //    var parms = new MySqlParameter[]
        //    {
        //        new MySqlParameter("@str", w)
        //    };
        //    var dt = DataAccess.ExecuteQuery(sql, parms);
        //    var list = new List<BlogEntity>();
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        var en = Convert(dr);
        //        list.Add(en);
        //    }
        //    return list;
        //}

        public bool Insert(BlogEntity t)
        {
            //插入操作
            var sql = "Insert Into blog (blogTitle, blogType, blogRelease, blogAuthor) values (@blogTitle, @blogType, @blogRelease, @blogAuthor)";
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@blogTitle", t.blogTitle),
                new MySqlParameter("@blogType", t.blogType),
                new MySqlParameter("@blogRelease", t.blogRelease),
                new MySqlParameter("@blogAuthor", t.blogAuthor)
            };
            //parms[0].Value = t.blogTitle;
            //parms[1].Value = t.blogType;
            //parms[2].Value = t.blogRelease;
            //parms[3].Value = t.blogAuthor;

            return DataAccess.ExecuteSql(sql, parms) > 0;
        }

        public bool Update(BlogEntity t)
        {
            var sql = "update blog set blogTitle=@blogTitle,blogType=@blogType,blogRelease=@blogRelease,blogAuthor=@blogAuthor where blogId=@blogId";
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@blogTitle",t.blogTitle),
                new MySqlParameter("@blogType",t.blogType),
                new MySqlParameter("@blogRelease",t.blogRelease),
                new MySqlParameter("@blogAuthor",t.blogAuthor),
                new MySqlParameter("@blogId",t.blogId)
            };
            return DataAccess.ExecuteSql(sql, parms) > 0;
        }

        public bool UpdateContent(BlogEntity t)
        {
            var sql = "update blog set content=@content where blogId=@blogId";
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@content",t.content),
                new MySqlParameter("@blogId",t.blogId)
            };
            return DataAccess.ExecuteSql(sql, parms) > 0;
        }
        
    }
}
