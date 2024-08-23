using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Linq;
using System.Windows.Forms;
using DAL;

namespace BLL
{
    public class DescriptionBLL
    {
        private String _Code;
        private String _Name;
        private String _Report;

        public DescriptionBLL()
        {

        }

        public String Code
        {
            get { return _Code; }
            set { _Code = value; }
        }

        public String Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        public String Report
        {
            get { return _Report; }
            set { _Report = value; }
        }

        public void SelectDetail(String detailName, String reportCode)
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    var detailDAL = context.Description.FirstOrDefault(description => description.Name == detailName && description.Report == reportCode);

                    if (detailDAL != null)
                    {
                        Code = detailDAL.Code;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex.Message);
            }
        }
    }
}
