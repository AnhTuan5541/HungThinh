using HungThinh.Common;
using HungThinh.Data;
using HungThinh.Response;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using System.ComponentModel;
using System.Data;
using System.Security.Claims;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Drawing;

namespace HungThinh.Controllers
{
    public class AdminController : Controller
    {
        private readonly ConnectionStrings _connection;
        public AdminController(IOptions<ConnectionStrings> connection) { _connection = connection.Value; }
        public IActionResult Index()
        {
            return View();
        }
        [Route("admin/all-application")]
        public IActionResult AllApplication()
        {
            return View();
        }
        [Route("admin/profile")]
        public IActionResult Profile()
        {
            return View();
        }
        public IActionResult Detail()
        {
            return View();
        }
        [HttpGet]
        [Authorize]
        public IActionResult GetUserInfo(string username)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_CheckUserInfo", connection) { CommandType = CommandType.StoredProcedure };
                command.Parameters.AddWithValue("@username", username);
                //command.Parameters.AddWithValue("@password", hashPwd);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();
                if (data.Count == 0)
                {
                    CommonFunction.LogInfo(_connection.DefaultConnection, username, "Tài khoản chưa được tạo!", CommonFunction.FAIL, functionName);
                    var response = new CommonResponse<Dictionary<string, object>>
                    {
                        StatusCode = CommonFunction.FAIL,
                        Message = "Tài khoản chưa được tạo!",
                        Data = null,
                        size = 0
                    };
                    return Ok(response);
                }
                else
                {
                    Dictionary<string, object> userInfo = new Dictionary<string, object>();
                    List<Dictionary<string, object>> userList = new List<Dictionary<string, object>>();
                    string fullname = data[0]["fullname"].ToString();
                    string email = data[0]["email"].ToString();

                    using var connection2 = new SqlConnection(_connection.DefaultConnection);

                    using var command2 = new SqlCommand("HT_GetRoleByUsername", connection2) { CommandType = CommandType.StoredProcedure };
                    command2.Parameters.AddWithValue("@username", username);

                    connection2.Open();
                    var reader2 = command2.ExecuteReader();
                    List<Dictionary<string, object>> data2 = CommonFunction.GetDataFromProcedure(reader2);
                    connection2.Close();

                    userInfo.Add("username", username);
                    userInfo.Add("fullname", fullname);
                    userInfo.Add("email", email);
                    userInfo.Add("role", data2);
                    userList.Add(userInfo);

                    CommonFunction.LogInfo(_connection.DefaultConnection, username, "Get user info successfully", CommonFunction.SUCCESS, functionName);
                    var response = new CommonResponse<Dictionary<string, object>>
                    {
                        StatusCode = CommonFunction.SUCCESS,
                        Message = "Get user info successfully",
                        Data = userList,
                        size = userList.Count()
                    };
                    return Ok(response);

                }
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
        public IActionResult UpdateUserInfo(string username, string email, string fullname)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateUserInfo", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@fullname", fullname);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Update user info successfully!";
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
        public IActionResult UpdateUserInfoWithPwd(string username, string email, string fullname, string password)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                string hashPwd = BCrypt.Net.BCrypt.HashPassword(password);
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateUserInfoWithPwd", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@fullname", fullname);
                command.Parameters.AddWithValue("@password", hashPwd);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Update user info successfully!";
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
        public IActionResult GetUser()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_GetUser", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                //command.Parameters.AddWithValue("@username", username);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Get user successfully!";
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
        public IActionResult DeleteUser(string username)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_DeleteUser", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@username", username);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Xóa người dùng thành công!";
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
