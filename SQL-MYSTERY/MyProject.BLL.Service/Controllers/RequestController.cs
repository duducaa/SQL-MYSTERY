using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MyProject.DAL;
using Newtonsoft.Json;
using System.Data;

namespace MyProject.BLL.Service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RequestController : ControllerBase
    {
        [HttpPost(Name = "SelectQuery")]
        public ActionResult<DataTable> SelectQuery([FromBody] string query)
        {
            try
            {
                UserCmdSelect user = new UserCmdSelect();
                DataTable dt = user.TabelaGenerica(query);

                return dt != null ? Ok(JsonConvert.SerializeObject(dt)) : NotFound();
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }

        [HttpPost("InsertQuery")]
        public ActionResult<Dictionary<string, int>> InsertQuery([FromBody] string query)
        {
            try
            {
                UserCmdInsert user = new UserCmdInsert();
                Dictionary<string, string> response = user.InsertCulpado(query);

                string code;
                if (response.TryGetValue("Code", out code))
                {
                    int intCode = Convert.ToInt32(response["Code"]);
                    if (intCode == 1062 && query.Trim().Split(" ")[2].ToUpper() == "TB_SOLUCAO")
                    {
                        response.Clear();
                        response.Add("Message", "Você venceu");
                    }
                }

                return Ok(JsonConvert.SerializeObject(response));
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
