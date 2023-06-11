using MyProject.DAL.Models;
using System.Data;
using System.Data.Common;
using MySql.Data.MySqlClient;

namespace MyProject.DAL
{
    public class UserCmdInsert : SqlMysteryContext
    {
        public String InsertCulpado(String comando)
        {


           
            try
            {
                int i;
                MySqlConnection com = new MySqlConnection("Server=localhost;Database=sql_mystery;Uid=root;Pwd=1234;");
                MySqlCommand cmd = new MySqlCommand(comando, com);
                i = 0;
                com.Open();
                i= cmd.ExecuteNonQuery();
                com.Close();
                if (i==1)
                {
                    return "insert ocorreu tranquilamente";
                }
                else
                {
                    return "insert nao ocorreu verifique se esta inserindo na tabela certa";

                }

            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
                return ex.Message;
            }
            catch (System.Exception e)
            {
                Console.WriteLine(e.Message);
                return e.Message;
            }


        }
    }
}
