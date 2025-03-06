using HungThinh.Common;
using HungThinh.Data;
using HungThinh.Response;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using System.Data;
using System.Security.Claims;

namespace HungThinh.Controllers
{
    public class FooterController : Controller
    {
        private readonly ILogger<FooterController> _logger;
        private readonly ConnectionStrings _connection;
        public FooterController(ILogger<FooterController> logger, IOptions<ConnectionStrings> connection)
        {
            _logger = logger;
            _connection = connection.Value;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [Authorize]
        public IActionResult GetFooter()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_GetFooter", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                //command.Parameters.AddWithValue("@role", role);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Get footer successfully!";
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.SUCCESS, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.SUCCESS,
                    Message = resultMessage,
                    Data = data,
                    size = data.Count
                };
                return Ok(response);
            }
            catch (Exception ex)
            {
                // Xử lý lỗi (ví dụ: log lỗi, trả về phản hồi lỗi)
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, ex.Message, CommonFunction.ERROR, functionName);
                var errorResponse = new CommonResponse<User>
                {
                    StatusCode = CommonFunction.ERROR,
                    Message = ex.Message,
                    Data = null,
                    size = 0
                };
                return StatusCode(500, errorResponse);
            }
        }
        [HttpPost]
        [Authorize]
        public IActionResult UpdateFooter(int id, string x, string facebook, string instagram, string linkedlin)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateFooter", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@id", id);
                command.Parameters.AddWithValue("@x", x == null ? "" : x);
                command.Parameters.AddWithValue("@facebook", facebook == null ? "" : facebook);
                command.Parameters.AddWithValue("@instagram", instagram == null ? "" : instagram);
                command.Parameters.AddWithValue("@linkedlin", linkedlin == null ? "" : linkedlin);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Cập nhật footer thành công!";
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.SUCCESS, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.SUCCESS,
                    Message = resultMessage,
                    Data = data,
                    size = data.Count
                };
                return Ok(response);
            }
            catch (Exception ex)
            {
                // Xử lý lỗi (ví dụ: log lỗi, trả về phản hồi lỗi)
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, ex.Message, CommonFunction.ERROR, functionName);
                var errorResponse = new CommonResponse<User>
                {
                    StatusCode = CommonFunction.ERROR,
                    Message = ex.Message,
                    Data = null,
                    size = 0
                };
                return StatusCode(500, errorResponse);
            }
        }
    }
}
