using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace BlogSystem.Data
{
    public class DataAccess
    {
        private static string ConnectionString =  ConfigurationManager.ConnectionStrings["MySQLConnectionString"].ConnectionString;
        /// <summary>
        /// 执行SQL语句
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="parms"></param>
        /// <returns></returns>
        public static int ExecuteSql(string sql, MySqlParameter[] parms)
        {
            using (MySqlConnection conn = getCon())
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = sql;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    foreach (var parameter in parms)
                    {
                        cmd.Parameters.Add(parameter);
                    }
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// 返回SQL语句查询结果
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="parms"></param>
        /// <returns></returns>
        public static DataTable ExecuteQuery(string sql, MySqlParameter[] parms)
        {
            using (MySqlConnection conn = getCon())
            {
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = sql;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = conn;
                    foreach (var parameter in parms)
                    {
                        cmd.Parameters.Add(parameter);
                    }
                    var oda = new MySqlDataAdapter(cmd);
                    var dt = new DataTable();
                    oda.Fill(dt);

                    return dt;
                }
            }
        }

        private static MySqlConnection getCon()
        {
            MySqlConnection myCon = null;
            try
            {
                myCon = new MySqlConnection(ConnectionString);
                myCon.Open();
            }
            catch (MySqlException e)
            {
                //抛出连接MySql数据库的异常
                throw new Exception(e.Message);
            }
            return myCon;
        }

        public static object GetEntity<T>(string sql, MySqlParameter[] parms)
        {
            try
            {
                using (MySqlConnection conn = getCon())
                {
                    if (conn.State == ConnectionState.Closed)
                        conn.Open();
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = conn;
                        foreach (var parameter in parms)
                        {
                            cmd.Parameters.Add(parameter);
                        }
                        var oda = new MySqlDataAdapter(cmd);
                        var dt = new DataTable();
                        oda.Fill(dt);
                        if (dt.Rows.Count >0)
                        {
                            return dt.Rows[0];
                        }
                        return null;
                    }
                }
            } catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
