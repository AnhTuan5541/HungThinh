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
    public class NangLucController : Controller
    {
        private readonly ILogger<NangLucController> _logger;
        private readonly ConnectionStrings _connection;
        public NangLucController(ILogger<NangLucController> logger, IOptions<ConnectionStrings> connection)
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
        public IActionResult GetNangLuc()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_GetNangLuc", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                //command.Parameters.AddWithValue("@role", role);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Get năng lực successfully!";
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
        [HttpGet]
        [Authorize]
        public IActionResult GetHoSoNangLuc()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_GetHoSoNangLuc", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                //command.Parameters.AddWithValue("@role", role);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Get hồ sơ năng lực successfully!";
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
        //[HttpPost]
        //[Authorize]
        //public IActionResult UpdateHSNangLuc(string file_url, string file_name)
        //{
        //    string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
        //    string userid = User.FindFirstValue(ClaimTypes.Name);
        //    try
        //    {
        //        using var connection = new SqlConnection(_connection.DefaultConnection);
        //        using var command = new SqlCommand("HT_UpdateHoSoNangLuc", connection) { CommandType = CommandType.StoredProcedure };

        //        // Thêm các tham số cho stored procedure (nếu cần)
        //        command.Parameters.AddWithValue("@id", 1);
        //        command.Parameters.AddWithValue("@file_url", file_url == null ? "" : file_url);
        //        command.Parameters.AddWithValue("@file_name", file_name == null ? "" : file_name);

        //        connection.Open();
        //        var reader = command.ExecuteReader();
        //        List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
        //        connection.Close();

        //        string resultMessage = "Update hồ sơ năng lực thành công!";
        //        CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.SUCCESS, functionName);
        //        var response = new CommonResponse<Dictionary<string, object>>
        //        {
        //            StatusCode = CommonFunction.SUCCESS,
        //            Message = resultMessage,
        //            Data = data,
        //            size = data.Count
        //        };
        //        return Ok(response);
        //    }
        //    catch (Exception ex)
        //    {
        //        // Xử lý lỗi (ví dụ: log lỗi, trả về phản hồi lỗi)
        //        CommonFunction.LogInfo(_connection.DefaultConnection, userid, ex.Message, CommonFunction.ERROR, functionName);
        //        var errorResponse = new CommonResponse<User>
        //        {
        //            StatusCode = CommonFunction.ERROR,
        //            Message = ex.Message,
        //            Data = null,
        //            size = 0
        //        };
        //        return StatusCode(500, errorResponse);
        //    }
        //}
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> UploadFile(IFormFile file)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                var response = await CommonFunction.UploadFilePDF(file);

                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateHoSoNangLuc", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@id", 1);
                command.Parameters.AddWithValue("@file_url", response.Data.FirstOrDefault()["fileUrl"].ToString());
                command.Parameters.AddWithValue("@file_name", response.Data.FirstOrDefault()["fileName"].ToString());

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                CommonFunction.LogInfo(_connection.DefaultConnection, userid, "Update hồ sơ năng lực thành công!", CommonFunction.SUCCESS, functionName);
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
        public IActionResult UpdateNangLuc(int id, string nang_luc, string detail)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateNangLuc", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@id", id);
                command.Parameters.AddWithValue("@nang_luc", nang_luc);
                command.Parameters.AddWithValue("@detail", detail == null ? "" : detail);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Cập nhật năng lực thành công!";
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
