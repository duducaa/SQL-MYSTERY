using MyProject.DAL.Models;
using System.Data;
using System.Data.Common;
using MySql.Data.MySqlClient;

namespace MyProject.DAL
{
    public class UserCmdInsert : SqlMysteryContext
    {
        public void InsertCulpado(String comando)
        {


            MySqlConnection com = new MySqlConnection("Server=localhost;Database=sql_mystery;Uid=root;Pwd=1234;");
            MySqlCommand cmd = new MySqlCommand(comando, com);
            try
            {
                com.Open();
                cmd.ExecuteNonQuery();
                com.Close();
          
            }
            catch (System.Exception e)
            {
                Console.WriteLine(e.Message);
               
            }


        }
    }
}
