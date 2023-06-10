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
                user.InsertCulpado(query);

                Dictionary<string, int> response = new Dictionary<string, int>();
                response.Add("response", 1);
                return Ok(JsonConvert.SerializeObject(response));
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
