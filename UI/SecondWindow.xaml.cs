
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using CsvHelper;
using System.Text.RegularExpressions;
using Microsoft.Office.Interop;
using ClosedXML.Excel;
using System.Reflection;
using DocumentFormat.OpenXml.Packaging;
using System;
using System.Linq;
using System.Windows.Forms;
using System.Windows;
using System.IO;
using System.Data;
using System.Runtime.Serialization.Formatters.Binary;
using Microsoft.Office.Interop.Excel;
using Excel = Microsoft.Office.Interop.Excel;
using System.Diagnostics;
using BLL;

namespace UI
{

    public partial class SecondWindow : System.Windows.Window
    {
        private SpreadsheetBLL _Sreadsheet;
        private MainWindow _MainWindow;
        private static int _Code;
        private System.Data.DataTable _Spreadsheets;

        public SecondWindow(MainWindow mainWindow)
        {

            InitializeComponent();

            MainWindow = mainWindow;
            
            lblDetailName.Content = MainWindow.DetailBLL.Name;
            
            Spreadsheets = new System.Data.DataTable();

            FillDataGrid(mainWindow.DetailBLL.Code);
        }

        public MainWindow MainWindow
        {
            get { return _MainWindow; }
            set { _MainWindow = value; }
        }

        public SpreadsheetBLL Spreadsheet
        {
            get { return _Sreadsheet; }
            set { _Sreadsheet = value; }
        }

        public System.Data.DataTable Spreadsheets
        {
            get { return _Spreadsheets; }
            set { _Spreadsheets = value; }
        }

        public static int Code
        {
            get { return _Code; }
            set { _Code = value; }
        }

        private void btnBackToMain_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();

            MainWindow.Show();
        }

        private void btnUpload_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openedFile = new OpenFileDialog();

            if (openedFile.ShowDialog() != System.Windows.Forms.DialogResult.OK)
            {
                return;
            }
            else
            {
                dgSpreadsheets.Visibility = Visibility.Visible;
                
                String fileName = CharacterReplacement(openedFile);
                String detailName = MainWindow.DetailBLL.Name;

                if (IsMatchOnCharacters(fileName, detailName))
                {
                    ReadCSVFile(openedFile.FileName);
                }
                else
                {
                    if (dgSpreadsheets.Items.Count == 0)
                    {
                        dgSpreadsheets.Visibility = Visibility.Collapsed;
                    }

                    lblMessage.Content = "Archivo no coincide! Inténtelo nuevamente!";
                    lblMessage.Visibility = Visibility;
                    LabelTimer();
                }
            }
        }

        public void ReadCSVFile(String strFilePath)
        {
            System.Data.DataTable dt = new System.Data.DataTable();

            using (StreamReader sr = new StreamReader(strFilePath))
            {
                String[] headers = sr.ReadLine().Split(',');

                foreach (String header in headers)
                {
                    dt.Columns.Add(header);
                }

                while (!sr.EndOfStream)
                {
                    String[] rows = sr.ReadLine().Split(',');

                    DataRow dr = dt.NewRow();

                    for (int i = 0; i < headers.Length; i++)
                    {
                        dr[i] = rows[i];
                    }

                    dt.Rows.Add(dr);
                }

            }

            CreateSpreadsheet(dt);

            Spreadsheets.Merge(dt, true);

            dgSpreadsheets.ItemsSource = Spreadsheets.AsDataView();

            Spreadsheet.Create();
        }

        private void CreateSpreadsheet(System.Data.DataTable newDataTable)
        {
            Spreadsheet = new SpreadsheetBLL();

            if (Spreadsheet.IsEmptyOnInsert())
            {
                Code = Code + 1;
                Spreadsheet.Code = Code;
            }
            else
            {
                int newCode = SupportBLL.CodeToChange();
                Spreadsheet.Code = newCode + 1;
            }

            DateTime currentDate = DateTime.Now;
            String strCurrentDate = currentDate.ToString("dd-MM-yyyy");
            Spreadsheet.Generated = strCurrentDate;
            lblDateGenerated.Content = strCurrentDate;

            TimeSpan time = DateTime.Now.TimeOfDay;
            Spreadsheet.Time = time;
            lblTimeGenerated.Content = time;

            Spreadsheet.File = ConvertDataTableToByte(newDataTable);

            String detailCode = MainWindow.DetailBLL.Code;
            Spreadsheet.Description = detailCode;
        }

        private byte[] ConvertDataTableToByte(System.Data.DataTable dataTable)
        {
            byte[] binaryDataResult = null;

            using (MemoryStream memStream = new MemoryStream())
            {
                BinaryFormatter brFormatter = new BinaryFormatter();

                brFormatter.Serialize(memStream, dataTable);

                binaryDataResult = memStream.ToArray();
            }

            return binaryDataResult;
        }

        private void ClearControl()
        {
            txtSearchDetail.Text = String.Empty;
        }

        private void btnShowAll_Click(object sender, RoutedEventArgs e)
        {
            if (dgSpreadsheets.Items.Count > 0)
            {

                Spreadsheets.Clear();

                Spreadsheet.RetrieveSpreadsheetByDescription(MainWindow.DetailBLL.Code);

                for (int i = 0; i < Spreadsheet.Spreadsheets.Count(); i++)
                {
                    byte[] file = Spreadsheet.Spreadsheets.ElementAt(i).File;

                    if (file != null)
                    {
                        Spreadsheets.Merge(ByteToDataTable(file), false);
                    }
                }

                dgSpreadsheets.ItemsSource = Spreadsheets.AsDataView();
            }
            else
            {
                lblMessage.Content = "Detalles vacíos!";
                lblMessage.Visibility = Visibility;
                LabelTimer();   
            }
        }

        private void btnSearchDetail_Click(object sender, RoutedEventArgs e)
        {
            String strSearchDate = txtSearchDetail.Text;
            String newFormat = DateFormat(strSearchDate);

            if (Spreadsheet.IsEmptyOnDescription(MainWindow.DetailBLL.Code, newFormat))
            {
                Spreadsheets.Clear();

                if (dgSpreadsheets.Visibility == Visibility.Collapsed)
                {
                    dgSpreadsheets.Visibility = Visibility;
                }

                Spreadsheet.RetrieveSpreadsheetByDate(newFormat, MainWindow.DetailBLL.Code);

                for (int i = 0; i < Spreadsheet.Spreadsheets.Count(); i++)
                {
                    if (Spreadsheet.Spreadsheets.ElementAt(i).Generated == newFormat)
                    {
                        byte[] file = Spreadsheet.Spreadsheets.ElementAt(i).File;
                        Spreadsheets.Merge(ByteToDataTable(file), false);
                    }
                }

                dgSpreadsheets.ItemsSource = Spreadsheets.AsDataView();

                ClearControl();
            }
            else
            {
                lblMessage.Content = "No existen detalles con esa fecha!";
                lblMessage.Visibility = Visibility;
                LabelTimer();
            }

            ClearControl();
 
        }

        public void FillDataGrid(String descriptionName)
        {
            Spreadsheet = new SpreadsheetBLL();

            if (Spreadsheet.IsEmpty(descriptionName) == false)
            {
                Spreadsheet.RetrieveSpreadsheetByDescription(descriptionName);

                for (int i = 0; i < Spreadsheet.Spreadsheets.Count(); i++)
                {
                    byte[] file = Spreadsheet.Spreadsheets.ElementAt(i).File;


                    Spreadsheets.Merge(ByteToDataTable(file));
                }

                dgSpreadsheets.ItemsSource = Spreadsheets.AsDataView();

            }
            else
            {
                dgSpreadsheets.Visibility = Visibility.Collapsed;

                lblMessage.Content = "No hay detalles a mostrar!";
   
                LabelTimer();
            }
        }

        public void LabelTimer()
        {
            var timer = new Timer();

            //It will tick in 3 seconds (3*1000)
            //4000
            timer.Interval = 4000;

            timer.Tick += (s, e) =>

            {
                lblMessage.Visibility = Visibility.Collapsed;
                timer.Stop();
            };

            timer.Start();
        }

        private System.Data.DataTable ByteToDataTable(byte[] byteArrayData)
        {
            System.Data.DataTable dt;

            using (MemoryStream stream = new MemoryStream(byteArrayData))
            {
                BinaryFormatter bformatter = new BinaryFormatter();

                dt = (System.Data.DataTable)bformatter.Deserialize(stream);
            }
            return dt;
        }

        private String CharacterReplacement(OpenFileDialog file)
        {
            String input = file.SafeFileName;
            String output = input.Replace("_", " ").Replace("RawData", " ").Replace("by", "By").Replace(".csv", " ");

            return output;
        }

        private Boolean IsMatchOnCharacters(String find, String source)
        {

            int matches = 0;

            foreach (String word in find.Split(' '))
            {
                if (source.Contains(word))
                {
                    matches++;
                }
            }

            if (matches > 5)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private void btnDownload_Click(object sender, RoutedEventArgs e)
        {

            if (dgSpreadsheets.Items.Count > 0)
            {
                ToExcel(Spreadsheets);
            }
            else
            {
                lblMessage.Content = "No hay archivos disponibles!";
                lblMessage.Visibility = Visibility;
                LabelTimer();
            }
        }

        private void ToExcel(System.Data.DataTable spreadsheets)
        {
            Excel.Application objexcelapp = new Excel.Application();

            objexcelapp.Application.Workbooks.Add(Type.Missing);

            objexcelapp.Columns.AutoFit();

            for (int i = 1; i < spreadsheets.Columns.Count + 1; i++)
            {
                Range xlRange = (Range)objexcelapp.Cells[1, i];
                xlRange.Font.Bold = -1;
                xlRange.Borders.LineStyle = XlLineStyle.xlContinuous;
                xlRange.Borders.Weight = 1d;
                xlRange.HorizontalAlignment = XlHAlign.xlHAlignCenter;
                objexcelapp.Cells[1, i] = spreadsheets.Columns[i - 1].ColumnName;
            }

            for (int i = 0; i < spreadsheets.Rows.Count; i++)
            {
                for (int j = 0; j < spreadsheets.Columns.Count; j++)
                {
                    if (spreadsheets.Rows[i][j] != null)
                    {
                        Range xlRange = (Range)objexcelapp.Cells[i + 2, j + 1];
                        xlRange.Borders.LineStyle = XlLineStyle.xlContinuous;
                        xlRange.Borders.Weight = 1d;
                        objexcelapp.Cells[i + 2, j + 1] = spreadsheets.Rows[i][j].ToString();
                    }
                }
            }

            objexcelapp.Columns.AutoFit();

            System.Windows.Forms.Application.DoEvents();

            if (Directory.Exists("C:\\Detalles\\")) 
            {
                objexcelapp.ActiveWorkbook.SaveCopyAs("C:\\Detalles\\" + MainWindow.DetailBLL.Name.Trim() + ".xlsx");
            }
            else
            {
                Directory.CreateDirectory("C:\\Detalles\\");
                objexcelapp.ActiveWorkbook.SaveCopyAs("C:\\Detalles\\" + MainWindow.DetailBLL.Name.Trim() + ".xlsx");
            }

            objexcelapp.ActiveWorkbook.Saved = true;

            System.Windows.Forms.Application.DoEvents();

            foreach (Process proc in Process.GetProcessesByName("Excel"))
            {
                proc.Kill();
            }
        }

        private String DateFormat(String date)
        {
            String output = date.Replace("/", "-");

            return output;
        }
    }
}