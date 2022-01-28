using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class ConnectionDB
    {
        protected SqlConnection cnn;
        protected void Connect()
        {
            try
            {
                cnn = new SqlConnection("Data Source=DESKTOP-07GPHH6;Initial Catalog=HBR;User ID=sa;Password=123456789");
                cnn.Open();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
            }
        }
        protected void Disconnect()
        {
            try
            {
                cnn.Close();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.StackTrace);
            }
        }
    }
}
