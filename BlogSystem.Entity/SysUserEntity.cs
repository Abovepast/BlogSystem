using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogSystem.Entity
{
    public class SysUserEntity: BaseEntity
    {
        public string UserName { get; set; }
        public string UserPwd { get; set; }
    }
}
