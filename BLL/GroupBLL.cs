using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System;

namespace BLL
{
    public class GroupBLL
    {
        public String _ID;
        public String _Name;

        public GroupBLL() { }

        public String ID
        {
            get { return _ID; }
            set { _ID = value; }
        }

        public String Name
        {
            get { return _Name; }
            set { _Name = value; }
        }
    }
}
