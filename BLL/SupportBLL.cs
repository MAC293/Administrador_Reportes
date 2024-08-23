using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
using DAL;

namespace BLL
{
    public static class SupportBLL
    {
        public static int CodeToChange()
        {
            using (DBEntities context = new DBEntities())
            {
                int code = int.Parse(context.Spreadsheet
                          .OrderByDescending(excel => excel.Code)
                          .Select(excel => excel.Code)
                          .First().ToString());

                return code;
            }
        }
    }
}
