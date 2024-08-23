using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using BLL;

namespace UI
{

    public partial class MainWindow : Window
    {

        private GroupBLL _GroupBLL;
        private ReportBLL _ReportBLL;
        private DescriptionBLL _DetailBLL;

        public MainWindow()
        {
            InitializeComponent();
        }

        public GroupBLL GroupBLL
        {
            get { return _GroupBLL; }
            set { _GroupBLL = value; }
        }

        public ReportBLL ReportBLL
        {
            get { return _ReportBLL; }
            set { _ReportBLL = value; }
        }

        public DescriptionBLL DetailBLL
        {
            get { return _DetailBLL; }
            set { _DetailBLL = value; }
        }

        private void btnDetail_Click(object sender, RoutedEventArgs e)
        {

            this.Hide();
            
            SecondWindow secondWindow = new SecondWindow(this);

            secondWindow.Show();
        }

        private void cmbGroup_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (!cmbGroup.IsLoaded)
                {
                    return;
                }

                String groupID = String.Empty;
                String groupName = String.Empty;

                if (cmbGroup.SelectedValue == cmbiCDLV)
                {
                    groupID = "CDLV";
                    groupName = "Ciudad de los Valles";

                }
                else if (cmbGroup.SelectedValue == cmbiLGVL)
                {
                    groupID = "LGVL";
                    groupName = "Longovilo";
                }

                GroupBLL = new GroupBLL();

                GroupBLL.ID = groupID;


                GroupBLL.Name = groupName;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex.Message);
            }
        }

        
        private void cmbReport_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (!cmbReport.IsLoaded)
                {
                    return;
                }

                ReportBLL = new ReportBLL();

                String reportName = ((ComboBoxItem)cmbReport.SelectedItem).Content as String;
                ReportBLL.Name = reportName;

                String groupFK = String.Empty;
                groupFK = GroupBLL.ID;
                ReportBLL.Group = groupFK;

                ReportBLL.SelectReport(reportName, groupFK);

                ReportBLL.RetrieveDescriptions();

                ReportBLL.Descriptions.OrderBy(d=> d.Name).ToList();

                if (cmbDetail.Items.Count > 0)
                {
                    var defaultSelection = cmbDetail.Items[0];
                    cmbDetail.Items.Clear();
                    cmbDetail.Items.Add(defaultSelection);
                    cmbDetail.SelectedIndex = 0;
                }

                for (int i = 0; i < ReportBLL.Descriptions.Count; i++)
                {
                    cmbDetail.Items.Add(ReportBLL.Descriptions.ElementAt(i).Name);   
                }
            }
            catch (Exception)
            {
                if (cmbReport.SelectedIndex != 0)
                {
                    cmbReport.SelectedIndex = 0;

                    MessageBox.Show("Debe seleccionar un Grupo primero!");
                }
            }
        }

        private void cmbDetail_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (!cmbDetail.IsLoaded)
                {
                    return;
                }

                if (cmbDetail.Items.Count > 0)
                {
                    String detailName = cmbDetail.SelectedItem.ToString();

                    DetailBLL = new DescriptionBLL();

                    DetailBLL.Name = detailName;

                    DetailBLL.SelectDetail(detailName, ReportBLL.Code);

                    String reportCode = ReportBLL.Code;
                    DetailBLL.Report = reportCode;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex.Message);
            }
        }
    }
}
