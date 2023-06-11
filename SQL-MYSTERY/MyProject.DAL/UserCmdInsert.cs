using MyProject.DAL.Models;
using System.Data;
using System.Data.Common;
using MySql.Data.MySqlClient;

namespace MyProject.DAL
{
    public class UserCmdInsert : SqlMysteryContext
    {
        public int InsertCulpado(String comando)
        {


           
            try
            {
                int i;
                MySqlConnection com = new MySqlConnection("Server=localhost;Database=sql_mystery;Uid=root;Pwd=1234;");
                MySqlCommand cmd = new MySqlCommand(comando, com);
                com.Open();
               i= cmd.ExecuteNonQuery();
                com.Close();
                return i;
          
            }
            catch (System.Exception e)
            {
                Console.WriteLine(e.Message);
                return -2;
            }


        }
    }
}
