using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System;
using System.Linq;
using System.Windows.Forms;
using DAL;

namespace BLL
{
    public class UserBLL
    {
        private String _Name;
        private String _Password;

        public UserBLL()
        {

        }

        public String Name
        {
            get { return _Name; }
            set { _Name = value; }
        }

        public String Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        public Boolean LogIn()
        {
            try
            {
                using (DBEntities context = new DBEntities())
                {
                    var userLogInDAL = context.Member.FirstOrDefault(user => user.Username == Name
                    && user.Password == Password);

                    if (userLogInDAL != null && PasswordComparison(Password.Trim(), userLogInDAL.Password.Trim()) &&
                        UsernameComparison(Name.Trim(), userLogInDAL.Username.Trim()))
                    {

                        MessageBox.Show("Acceso concedido!");

                        context.SaveChanges();
                        
                        return true;
                    }

                    MessageBox.Show("Acceso denegado!");

                    return false;
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show("Exception: " + ex.Message);
            }

            return false;
        }

        private Boolean PasswordComparison(String input, String source)
        {
            if (String.Equals(input, source, StringComparison.CurrentCulture))
            {
                return true;
            }

            return false;
        }

        private Boolean UsernameComparison(String input, String source)
        {
            if (String.Equals(input, source, StringComparison.CurrentCulture))
            {
                return true;
            }

            return false;
        }
    }
}
