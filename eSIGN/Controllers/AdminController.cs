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
using System.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

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
        [Route("/profile")]
        public IActionResult Profile()
        {
            return View();
        }
        public IActionResult Role()
        {
            return View();
        }
        public IActionResult Home()
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
                    int id_role = Convert.ToInt32(data[0]["id_role"]);
                    string role = data[0]["role"].ToString();

                    //using var connection2 = new SqlConnection(_connection.DefaultConnection);

                    //using var command2 = new SqlCommand("HT_GetRoleByUsername", connection2) { CommandType = CommandType.StoredProcedure };
                    //command2.Parameters.AddWithValue("@username", username);

                    //connection2.Open();
                    //var reader2 = command2.ExecuteReader();
                    //List<Dictionary<string, object>> data2 = CommonFunction.GetDataFromProcedure(reader2);
                    //connection2.Close();

                    userInfo.Add("username", username);
                    userInfo.Add("fullname", fullname);
                    userInfo.Add("email", email);
                    userInfo.Add("id_role", id_role);
                    userInfo.Add("role", role);
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
        public IActionResult UpdateUserInfo(string username, string email, string fullname, int id_role, int id_user_role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            if(id_user_role != 1)
            {
                string resultMessage = "Update user info fail!";
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.FAIL, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = resultMessage,
                    Data = null,
                    size = 0
                };
                return Ok(response);
            }
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateUserInfo", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@email", email == null ? "" : email);
                command.Parameters.AddWithValue("@fullname", fullname == null ? "" : fullname);
                command.Parameters.AddWithValue("@id_role", id_role);

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
        public IActionResult UpdateUserInfoWithPwd(string username, string email, string fullname, string password, int id_role, int id_user_role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            if (id_user_role != 1)
            {
                string resultMessage = "Update user info fail!";
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.FAIL, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = resultMessage,
                    Data = null,
                    size = 0
                };
                return Ok(response);
            }
            try
            {
                string hashPwd = BCrypt.Net.BCrypt.HashPassword(password);
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateUserInfoWithPwd", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@email", email == null ? "" : email);
                command.Parameters.AddWithValue("@fullname", fullname == null ? "" : fullname);
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
        public IActionResult DeleteUser(string username, int id_user_role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            if (id_user_role != 1)
            {
                string resultMessage = "Delete user fail!";
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.FAIL, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = resultMessage,
                    Data = null,
                    size = 0
                };
                return Ok(response);
            }
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
        [HttpGet]
        [Authorize]
        public IActionResult GetRole()
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_GetRole", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                //command.Parameters.AddWithValue("@username", username);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Get role successfully!";
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
        public IActionResult AddUser(string username, string email, string fullname, string password, int id_role, int id_user_role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            if (id_user_role != 1)
            {
                string resultMessage = "Add user fail!";
                CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage, CommonFunction.FAIL, functionName);
                var response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = resultMessage,
                    Data = null,
                    size = 0
                };
                return Ok(response);
            }
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
                if (data.Count != 0)
                {
                    CommonFunction.LogInfo(_connection.DefaultConnection, username, "Tài khoản đã được tạo!", CommonFunction.FAIL, functionName);
                    var response = new CommonResponse<Dictionary<string, object>>
                    {
                        StatusCode = CommonFunction.FAIL,
                        Message = "Tài khoản đã được tạo!",
                        Data = null,
                        size = 0
                    };
                    return Ok(response);
                }
                else
                {
                    string hashPwd = BCrypt.Net.BCrypt.HashPassword(password);
                    using var connection2 = new SqlConnection(_connection.DefaultConnection);
                    using var command2 = new SqlCommand("HT_AddUser", connection2) { CommandType = CommandType.StoredProcedure };

                    // Thêm các tham số cho stored procedure (nếu cần)
                    command2.Parameters.AddWithValue("@username", username);
                    command2.Parameters.AddWithValue("@email", email == null ? "" : email);
                    command2.Parameters.AddWithValue("@fullname", fullname == null ? "" : fullname);
                    command2.Parameters.AddWithValue("@password", hashPwd);
                    command2.Parameters.AddWithValue("@id_role", id_role);

                    connection2.Open();
                    var reader2 = command2.ExecuteReader();
                    List<Dictionary<string, object>> data2 = CommonFunction.GetDataFromProcedure(reader2);
                    connection2.Close();

                    string resultMessage = "Thêm user thành công!";
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
        public IActionResult AddRole(string role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_AddRole", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@role", role);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Add role successfully!";
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
        public IActionResult UpdateRole(int id_role, string role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_UpdateRole", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@id_role", id_role);
                command.Parameters.AddWithValue("@role", role);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Update role successfully!";
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
        public IActionResult DeleteRole(int id_role)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            string userid = User.FindFirstValue(ClaimTypes.Name);
            try
            {
                if(id_role == 1)
                {
                    string resultMessage2 = "Không thể xóa quyền Administrator!";
                    CommonFunction.LogInfo(_connection.DefaultConnection, userid, resultMessage2, CommonFunction.FAIL, functionName);
                    var response2 = new CommonResponse<Dictionary<string, object>>
                    {
                        StatusCode = CommonFunction.FAIL,
                        Message = resultMessage2,
                        Data = null,
                        size = 0
                    };
                    return Ok(response2);
                }

                using var connection = new SqlConnection(_connection.DefaultConnection);
                using var command = new SqlCommand("HT_DeleteRole", connection) { CommandType = CommandType.StoredProcedure };

                // Thêm các tham số cho stored procedure (nếu cần)
                command.Parameters.AddWithValue("@id_role", id_role);

                connection.Open();
                var reader = command.ExecuteReader();
                List<Dictionary<string, object>> data = CommonFunction.GetDataFromProcedure(reader);
                connection.Close();

                string resultMessage = "Delete role successfully!";
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
