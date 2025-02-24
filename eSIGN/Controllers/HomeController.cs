using HungThinh.Common;
using HungThinh.Data;
using HungThinh.Models;
using HungThinh.Response;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using System.Data;
using System.Diagnostics;
using System.Security.Claims;

namespace HungThinh.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ConnectionStrings _connection;
        public HomeController(ILogger<HomeController> logger, IOptions<ConnectionStrings> connection)
        {
            _logger = logger;
            _connection = connection.Value;
        }

        public IActionResult Index()
        {
            return View();
        }
        [Route("ve-chung-toi")]
        public IActionResult VeChungToi()
        {
            return View();
        }
        [Route("linh-vuc-hoat-dong")]
        public IActionResult LinhVucHoatDong()
        {
            return View();
        }
        [Route("du-an")]
        public IActionResult DuAn()
        {
            return View();
        }
        [Route("nang-luc")]
        public IActionResult NangLuc()
        {
            return View();
        }
        [Route("tin-tuc")]
        public IActionResult TinTuc()
        {
            return View();
        }
        [Route("lien-he")]
        public IActionResult LienHe()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet]
        [Authorize]
        public IActionResult CountApplication()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("CountApplication", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@idCard", userid);

                connection.Open();
                var reader = command.ExecuteReader();

                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);

                CommonFunction.LogInfo(_connection.DefaultConnection, userid, "Count application successfully", CommonFunction.SUCCESS, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.SUCCESS,
                    Message = "Count application successfully",
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
        [HttpGet]
        [Authorize]
        public IActionResult CountApplicationSupport()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("CountApplicationSupport", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@idCard", userid);

                connection.Open();
                var reader = command.ExecuteReader();

                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);

                CommonFunction.LogInfo(_connection.DefaultConnection, userid, "Count application support successfully", CommonFunction.SUCCESS, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.SUCCESS,
                    Message = "Count application support successfully",
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

        [HttpGet]
        [Authorize]
        public IActionResult CountApplicationAll()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("CountApplicationAll", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@idCard", userid);

                connection.Open();
                var reader = command.ExecuteReader();

                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);

                CommonFunction.LogInfo(_connection.DefaultConnection, userid, "Count application all success", CommonFunction.SUCCESS, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.SUCCESS,
                    Message = "Count application all success",
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
