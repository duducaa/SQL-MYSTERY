using MyProject.DAL.Models;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace MyProject.DAL
{
    public class Class1 : SqlMysteryContext
    {
        public DataTable TabelaGenerica(String comando) {


            SqlConnection com = new SqlConnection("Server=localhost;Database=sql_mystery;Uid=root;Pwd=Ducaduca-1;");
            SqlCommand cmd = new SqlCommand(comando, com);
            try
            {
                com.Open();
                DataTable tab = ObterTabela(cmd.ExecuteReader());
                return tab;
            }
            finally
            {
                com.Close();
            }
           
        }

        public DataTable ObterTabela(DbDataReader reader)
        {
            DataTable tbEsquema = reader.GetSchemaTable();
            DataTable tbRetorno = new DataTable();

            foreach (DataRow r in tbEsquema.Rows)
            {
                if (!tbRetorno.Columns.Contains(r["ColumnName"].ToString()))
                {
                    DataColumn col = new DataColumn()
                    {
                        ColumnName = r["ColumnName"].ToString(),
                        Unique = Convert.ToBoolean(r["IsUnique"]),
                        AllowDBNull = Convert.ToBoolean(r["AllowDBNull"]),
                        ReadOnly = Convert.ToBoolean(r["IsReadOnly"])
                    };
                    tbRetorno.Columns.Add(col);
                }
            }

            while (reader.Read())
            {
                DataRow novaLinha = tbRetorno.NewRow();
                for (int i = 0; i < tbRetorno.Columns.Count; i++)
                {
                    novaLinha[i] = reader.GetValue(i);
                }
                tbRetorno.Rows.Add(novaLinha);
            }

            return tbRetorno;
        }
    }
}