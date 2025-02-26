using HungThinh.Common;
using HungThinh.Data;
using HungThinh.Response;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.DirectoryServices;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Options;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Text.RegularExpressions;
using OfficeOpenXml;

namespace HungThinh.Controllers
{
    public class AuthController : Controller
    {
        private readonly ConnectionStrings _connection;
        public AuthController(IOptions<ConnectionStrings> connection) { _connection = connection.Value; }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult GetUserInfo(string username, string password)
        {
            string functionName = ControllerContext.ActionDescriptor.ControllerName + "/" + System.Reflection.MethodBase.GetCurrentMethod().Name;
            try
            {
                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    CommonFunction.LogInfo(_connection.DefaultConnection, username, "Fail to Sign in: Tài khoản hoặc mật khẩu không được để trống!", CommonFunction.FAIL, functionName);
                    var response = new CommonResponse<Dictionary<string, object>>
                    {
                        StatusCode = CommonFunction.FAIL,
                        Message = "Fail to Sign in: Tài khoản hoặc mật khẩu không được để trống!",
                        Data = null,
                        size = 0
                    };
                    return Ok(response);
                }
                else {
                    string hashPwd = BCrypt.Net.BCrypt.HashPassword(password);
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
                        CommonFunction.LogInfo(_connection.DefaultConnection, username, "Login fail. Tài khoản chưa được tạo!", CommonFunction.FAIL, functionName);
                        var response = new CommonResponse<Dictionary<string, object>>
                        {
                            StatusCode = CommonFunction.FAIL,
                            Message = "Login fail. Tài khoản chưa được tạo!",
                            Data = null,
                            size = 0
                        };
                        return Ok(response);
                    }
                    else
                    {
                        if (BCrypt.Net.BCrypt.Verify(password, data[0]["password"].ToString()))
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

                            userInfo.Add("token", CommonFunction.GenerateToken(username));
                            userList.Add(userInfo);

                            CommonFunction.LogInfo(_connection.DefaultConnection, username, "Login successfully", CommonFunction.SUCCESS, functionName);
                            var response = new CommonResponse<Dictionary<string, object>>
                            {
                                StatusCode = CommonFunction.SUCCESS,
                                Message = "Login successfully",
                                Data = userList,
                                size = userList.Count()
                            };
                            return Ok(response);
                        }
                        else
                        {
                            CommonFunction.LogInfo(_connection.DefaultConnection, username, "Sai tài khoản hoặc mật khẩu!", CommonFunction.FAIL, functionName);
                            var response = new CommonResponse<Dictionary<string, object>>
                            {
                                StatusCode = CommonFunction.FAIL,
                                Message = "Sai tài khoản hoặc mật khẩu!",
                                Data = null,
                                size = 0
                            };
                            return Ok(response);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                CommonFunction.LogInfo(_connection.DefaultConnection, username, ex.Message, CommonFunction.ERROR, functionName);

                var errorResponse = new CommonResponse<User>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = ex.Message,
                    Data = null,
                    size = 0
                };
                return StatusCode(500, errorResponse);
            }
        }
    }
}
