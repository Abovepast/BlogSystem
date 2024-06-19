using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogSystem.Entity
{
    public class BlogEntity
    {
        // blogId blogTitle blogType blogRelease blogAuthor
        public int blogId { get; set; }
        public string blogTitle { get; set; }
        public string blogType { get; set; }
        public DateTime blogRelease { get; set; }
        public string blogAuthor { get; set; }
        public string content { get; set; }
    }
}
