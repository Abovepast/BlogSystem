using BlogSystem.Data;
using BlogSystem.Entity;
using BlogSystem.Inter;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace BlogSystem.Busi
{
    public class SysUserBusi : ISysUser
    {
        public bool CheckLogin(SysUserEntity user)
        {
            var sql = "Select * From SysUser Where UserName = @UserName And UserPwd = @UserPwd";
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@UserName", MySqlDbType.VarChar),
                new MySqlParameter("@UserPwd", MySqlDbType.VarChar)
            };
            parms[0].Value = user.UserName;
            parms[1].Value = user.UserPwd;

            return DataAccess.GetEntity<SysUserEntity>(sql, parms) != null;
        }

        public bool Delete(int id)
        {
            throw new NotImplementedException();
        }

        public SysUserEntity Get(int id)
        {
            throw new NotImplementedException();
        }

        public List<SysUserEntity> GetAll(string str)
        {
            throw new NotImplementedException();
        }

        public bool Insert(SysUserEntity t)
        {
            //插入操作
            var sql = "Insert Into SysUser (UserName, UserPwd) values (@UserName, @UserPwd)";
            var parms = new MySqlParameter[]
            {
                new MySqlParameter("@Id", MySqlDbType.Int32),
                new MySqlParameter("@UserName", MySqlDbType.VarChar),
                new MySqlParameter("@UserPwd", MySqlDbType.VarChar)
            };
            parms[0].Value = t.Id;
            parms[1].Value = t.UserName;
            parms[2].Value = t.UserPwd;
            return DataAccess.ExecuteSql(sql, parms) > 0;
        }

        public bool Update(SysUserEntity t)
        {
            throw new NotImplementedException();
        }
    }
}
