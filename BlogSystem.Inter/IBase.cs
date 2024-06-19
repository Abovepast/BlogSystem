using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogSystem.Inter
{
    public interface IBase<T>
    {
        bool Insert(T t);
        bool Update(T t);
        bool Delete(int id);
        T Get(int id);
        List<T> GetAll(string w);
    }
}
