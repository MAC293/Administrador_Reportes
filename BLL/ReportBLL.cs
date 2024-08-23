using System.Text;
using System.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using DAL;

namespace BLL
{
    public class ReportBLL
    {
        private String _Code;
        private String _Name;
        private String _Group;
        private List<DescriptionBLL> _Descriptions;


        public ReportBLL()
        {
            Descriptions = new List<DescriptionBLL>();
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

        public String Group
        {
            get { return _Group; }
            set { _Group = value; }
        }

        public List<DescriptionBLL> Descriptions
        {
            get { return _Descriptions; }
            set { _Descriptions = value; }
        }

        public Boolean SelectReport(String reportName, String groupID)
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    var reportDAL = context.Report.FirstOrDefault(report => report.Name == reportName && report.Location == groupID);

                    if (reportDAL != null)
                    {
                        Code = reportDAL.Code;
                    }

                    return context.SaveChanges() > 0;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex.Message);
            }

            return false;
        }

        public Boolean RetrieveDescriptions()
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    var descriptionTable = context.Description.Select((description =>
                                        new { description.Code, description.Name, description.Report })).ToList();

                    for (int i = 0; i < descriptionTable.Count(); i++)
                    {
                        if (descriptionTable.ElementAt(i).Report == Code)
                        {
                            var descriptionBLL = new DescriptionBLL();

                            descriptionBLL.Code = descriptionTable.ElementAt(i).Code;
                            descriptionBLL.Name = descriptionTable.ElementAt(i).Name;
                            descriptionBLL.Report = descriptionTable.ElementAt(i).Report;

                            Descriptions.Add(descriptionBLL);
                        }
                    }
                }
            }

            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }

            return true;
        }
    }
}
