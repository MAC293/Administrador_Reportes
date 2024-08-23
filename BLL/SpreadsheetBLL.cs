using System.Text;
using System.Threading.Tasks;
using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Linq;
using DAL;

namespace BLL
{
    public class SpreadsheetBLL
    {
        private int _Code;
        private byte[] _File;
        private String _Generated;
        private TimeSpan _Time;
        private String _Description;
        private List<SpreadsheetBLL> _Spreadsheets;

        public SpreadsheetBLL()
        {
            Spreadsheets = new List<SpreadsheetBLL>();
        }

        public int Code
        {
            get { return _Code; }
            set { _Code = value; }
        }

        public byte[] File
        {
            get { return _File; }
            set { _File = value; }
        }


        public String Generated
        {
            get { return _Generated; }
            set { _Generated = value; }
        }

        public TimeSpan Time
        {
            get { return _Time; }
            set { _Time = value; }
        }

        public String Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        public List<SpreadsheetBLL> Spreadsheets
        {
            get { return _Spreadsheets; }
            set { _Spreadsheets = value; }
        }

        public Boolean Create()
        {
            Boolean exit = false;

            try
            {
                using (DBEntities context = new DBEntities())
                {
                    var spreadsheetDAL = context.Spreadsheet.FirstOrDefault(spreadsheet => spreadsheet.Code == Code);

                    if (spreadsheetDAL == null)
                    {
                        spreadsheetDAL = new Spreadsheet();

                        spreadsheetDAL.Code = Code;
                        spreadsheetDAL.Archive = File;
                        spreadsheetDAL.Generated = Generated;
                        spreadsheetDAL.Hour = Time;
                        spreadsheetDAL.Description = Description;

                        context.Spreadsheet.AddObject(spreadsheetDAL);

                        exit = context.SaveChanges() > 0;
                    }

                    return exit;
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }

            return exit;
        }

        public void RetrieveSpreadsheetByDate(String generated, String detailCode)
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    Spreadsheets.Clear();

                    var spreadsheetTable = context.Spreadsheet.Select((excel =>
                    new { excel.Code, excel.Archive, excel.Generated, excel.Description })).ToList();

                    for (int i = 0; i < spreadsheetTable.Count(); i++)
                    {
                        if (spreadsheetTable.ElementAt(i).Description == detailCode)
                        {
                            if (spreadsheetTable.ElementAt(i).Generated == generated)
                            {
                                SpreadsheetBLL excelBLL = new SpreadsheetBLL();

                                excelBLL.Code = spreadsheetTable.ElementAt(i).Code;

                                if (spreadsheetTable.ElementAt(i).Archive != null)
                                {
                                    excelBLL.File = spreadsheetTable.ElementAt(i).Archive;
                                }

                                excelBLL.Generated = spreadsheetTable.ElementAt(i).Generated;
                                excelBLL.Description = spreadsheetTable.ElementAt(i).Description;

                                Spreadsheets.Add(excelBLL);
                            }
                        }
                    }
                }
            }

            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }
        }

        public void RetrieveSpreadsheetByDescription(String description)
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    Spreadsheets.Clear();

                    var spreadsheetTable = context.Spreadsheet.Select((excel =>
                    new { excel.Code, excel.Archive, excel.Generated, excel.Description })).ToList();


                    for (int i = 0; i < spreadsheetTable.Count(); i++)
                    {
                        if (spreadsheetTable.ElementAt(i).Description == description)
                        {
                            var excelBLL = new SpreadsheetBLL();

                            excelBLL.Code = spreadsheetTable.ElementAt(i).Code;
                            excelBLL.File = spreadsheetTable.ElementAt(i).Archive;
                            excelBLL.Generated = spreadsheetTable.ElementAt(i).Generated;
                            excelBLL.Description = spreadsheetTable.ElementAt(i).Description;

                            Spreadsheets.Add(excelBLL);
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                MessageBox.Show("Exception: " + ex.Message);
            }
        }

        public Boolean IsEmpty(String descriptionName)
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    if (context.Spreadsheet.Any(spreadsheet => spreadsheet.Description == descriptionName))
                    {
                        return false;
                    }
                }
            }

            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }

            return true;
        }

        public Boolean IsEmptyOnInsert()
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    if (!context.Spreadsheet.Any())
                    {
                        return true;
                    }
                }
            }

            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }

            return false;
        }

        public Boolean IsEmptyOnDescription(String descriptionCode, String dateToSearch)
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    Boolean sameDescription = context.Spreadsheet.Any(spreadsheet => spreadsheet.Description == descriptionCode);

                    if (sameDescription)
                    {
                        Boolean sameDate = context.Spreadsheet.Any(spreadsheet => spreadsheet.Generated == dateToSearch);

                        if (sameDate)
                        {
                            return true;
                        }
                    }

                    return false;
                }
            }

            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }

            return false;
        }

        //public Boolean RetrieveSpreadsheets(String generated)
        //{
        //    try
        //    {
        //        using (DBEntities context = new DBEntities())
        //        {
        //            //MessageBox.Show("Generated (BLL):" + generated);


        //            //DateTime datDateToSearch = DateTime.Parse(generated);


        //            //MessageBox.Show("Entered date: "+ datDateToSearch);

        //            var spreadsheetTable = context.Spreadsheet.Select((excel =>
        //            new { excel.Code, excel.Archive, excel.Generated, excel.Description })).ToList();

        //            //MessageBox.Show("datDateToSearch: " + datDateToSearch);


        //            for (int i = 0; i < spreadsheetTable.Count(); i++)
        //            {

        //                //MessageBox.Show("spreadsheetTable.ElementAt(i).Generated: " + spreadsheetTable.ElementAt(i).Generated);

        //                if (spreadsheetTable.ElementAt(i).Generated == generated)
        //                //if (spreadsheetTable.ElementAt(i).Generated == datDateToSearch)
        //                {
        //                    var excelBLL = new SpreadsheetBLL();

        //                    excelBLL.Code = spreadsheetTable.ElementAt(i).Code;

        //                    if (spreadsheetTable.ElementAt(i).Archive != null)
        //                    {
        //                        //MessageBox.Show("spreadsheetTable.ElementAt(i).Archive != null");
        //                        excelBLL.Testing = spreadsheetTable.ElementAt(i).Archive;

        //                    }

        //                    excelBLL.Generated = spreadsheetTable.ElementAt(i).Generated;
        //                    excelBLL.Description = spreadsheetTable.ElementAt(i).Description;


        //                    Spreadsheets.Add(excelBLL);
        //                }
        //            }
        //        }

        //    }

        //    catch (Exception ex)
        //    {

        //        MessageBox.Show("Exception: " + ex.Message);
        //    }

        //    return true;
        //}

    }
}
