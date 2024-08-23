using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using BLL;

namespace UI
{
    /// <summary>
    /// Interaction logic for LogIn.xaml
    /// </summary>
    public partial class LogIn : Window
    {

        private UserBLL _User;
        public LogIn()
        {
            InitializeComponent();
        }

        public UserBLL User
        {
            get { return _User; }
            set { _User = value; }
        }

        private void btnLogIn_Click(object sender, RoutedEventArgs e)
        {
            String name = txtUsername.Text;
            String password = txtPassword.Password;

            User = new UserBLL();

            User.Name = name;
            User.Password = password;

            if (User.LogIn())
            {
                this.Hide();

                MainWindow mainWindow = new MainWindow();

                mainWindow.Show();
            }
            else
            {
                Clear();
            }
        }

        private void Clear()
        {
            txtUsername.Text = String.Empty;
            txtPassword.Password = String.Empty;
        }

            
    }
}
