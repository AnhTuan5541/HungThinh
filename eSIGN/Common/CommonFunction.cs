using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Microsoft.AspNetCore.Http;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
using System.Data;
using System.Data.Common;
using Microsoft.AspNetCore.Mvc;
using HungThinh.Response;
using System.IO;
using System.Globalization;
using System.Drawing.Imaging;
using System.Drawing;


namespace HungThinh.Common
{
    public class CommonFunction
    {
        public static readonly string SUCCESS = "SUCCESS";
        public static readonly string FAIL = "FAIL";
        public static readonly string ERROR = "ERROR";
        private readonly IHostEnvironment _environment;
        public CommonFunction(IHostEnvironment environment)
        {
            _environment = environment;
        }
        public static List<Dictionary<string, object>> GetDataFromProcedure(SqlDataReader reader)
        {
            List<Dictionary<string, object>> dictionary = new List<Dictionary<string, object>>();
            while (reader.Read())
            {
                var row = new Dictionary<string, object>();
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    var columnName = reader.GetName(i);
                    var columnValue = reader.GetValue(i);
                    row.Add(columnName, columnValue);
                }
                dictionary.Add(row);
            }
            return dictionary;
        }

        public static string GenerateToken(string empID)
        {
            //Create token

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("Amkor_Technology_Vietnam_is_the_best_company_in_Viet_Nam"));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: "eSign",
                audience: "https://localhost:44309/",
                claims: new[] { new Claim(ClaimTypes.Name, empID) },
                expires: DateTime.UtcNow.AddHours(168),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
            //End create token
        }
        public static DateTime StartDate(string timeSpan)
        {
            string startDate = timeSpan.Substring(0, 10);
            DateTime date = DateTime.ParseExact(startDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            return date;
        }

        public static DateTime EndDate(string timeSpan)
        {
            string startDate = timeSpan.Substring(timeSpan.Length - 10);
            DateTime date = DateTime.ParseExact(startDate, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            return date;
        }
        public static void LogInfo(string DefaultConnection, string idCard, string info, string typeLog, string function)
        {
            using var connection = new SqlConnection(DefaultConnection);
            using var command = new SqlCommand("AddLogInfo", connection) { CommandType = CommandType.StoredProcedure };

            // Thêm các tham số cho stored procedure (nếu cần)
            command.Parameters.AddWithValue("@idCard", idCard);
            command.Parameters.AddWithValue("@info", info);
            command.Parameters.AddWithValue("@typeLog", typeLog);
            command.Parameters.AddWithValue("@function", function);

            connection.Open();
            var reader = command.ExecuteReader();
        }

        public async static Task<CommonResponse<Dictionary<string, object>>> UploadFile(IFormFile file)
        {
            var response = new CommonResponse<Dictionary<string, object>>
            {
                StatusCode = CommonFunction.SUCCESS,
                Message = "Upload file succsessfully.",
                Data = null,
                size = 0
            };

            // Kiểm tra loại tệp
            var allowedExtensions = new[] { ".jpg", ".jpeg", ".png" };
            var fileExtension = Path.GetExtension(file.FileName).ToLower();
            if (!allowedExtensions.Contains(fileExtension))
            {
                response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = "Loại file không hỗ trợ. Chỉ hỗ trợ các file .jpg, .jpeg, .png",
                    Data = null,
                    size = 0
                };
                return response;
            }

            // Kiểm tra kích thước tệp (giới hạn 5MB)
            var maxFileSize = 10 * 1024 * 1024; // 5MB
            if (file.Length > maxFileSize)
            {
                response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = "Giới hạn dung lượng file là 10MB (10MB limit).",
                    Data = null,
                    size = 0
                };
                return response;
            }

            string uniqueFileName = file.FileName;

            //Upload in db
            string base64String;
            using (var stream = new MemoryStream())
            {
                await file.CopyToAsync(stream);
                //var fileBytes = stream.ToArray();
                //base64String = Convert.ToBase64String(fileBytes);
                var image = Image.FromStream(stream);
                var compressedStream = new MemoryStream();
                var encoderParameters = new EncoderParameters(1);
                encoderParameters.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 40L); // Chất lượng nén (0-100)
                var codec = ImageCodecInfo.GetImageDecoders().First(c => c.FormatID == ImageFormat.Jpeg.Guid);
                image.Save(compressedStream, codec, encoderParameters);

                var fileBytes = compressedStream.ToArray();
                base64String = Convert.ToBase64String(fileBytes);
            }

            Dictionary<string, object> result = new Dictionary<string, object>();
            result.Add("fileUrl", base64String);
            result.Add("fileName", uniqueFileName);
            List<Dictionary<string, object>> fileUrl = new List<Dictionary<string, object>>();
            fileUrl.Add(result);

            response = new CommonResponse<Dictionary<string, object>>
            {
                StatusCode = CommonFunction.SUCCESS,
                Message = "Upload file succsessfully.",
                Data = fileUrl,
                size = 0
            };
            return response;
        }
        public async static Task<CommonResponse<Dictionary<string, object>>> UploadFilePDF(IFormFile file)
        {
            var response = new CommonResponse<Dictionary<string, object>>
            {
                StatusCode = CommonFunction.SUCCESS,
                Message = "Upload file succsessfully.",
                Data = null,
                size = 0
            };

            // Kiểm tra loại tệp
            var allowedExtensions = new[] { ".pdf", ".docx", ".xlsx" };
            var fileExtension = Path.GetExtension(file.FileName).ToLower();
            if (!allowedExtensions.Contains(fileExtension))
            {
                response = new CommonResponse<Dictionary<string, object>>
                {
                    StatusCode = CommonFunction.FAIL,
                    Message = "Loại file không hỗ trợ. Chỉ hỗ trợ các file .pdf, .docx, .xlsx",
                    Data = null,
                    size = 0
                };
                return response;
            }

            // Kiểm tra kích thước tệp (giới hạn 5MB)
            //var maxFileSize = 10 * 1024 * 1024; // 5MB
            //if (file.Length > maxFileSize)
            //{
            //    response = new CommonResponse<Dictionary<string, object>>
            //    {
            //        StatusCode = CommonFunction.FAIL,
            //        Message = "Giới hạn dung lượng file là 10MB (10MB limit).",
            //        Data = null,
            //        size = 0
            //    };
            //    return response;
            //}

            string uniqueFileName = file.FileName;
            //Upload in db
            string base64String;
            using (var stream = new MemoryStream())
            {
                await file.CopyToAsync(stream);
                var fileBytes = stream.ToArray();
                base64String = Convert.ToBase64String(fileBytes);
            }

            Dictionary<string, object> result = new Dictionary<string, object>();
            result.Add("fileUrl", base64String);
            result.Add("fileName", uniqueFileName);
            List<Dictionary<string, object>> fileUrl = new List<Dictionary<string, object>>();
            fileUrl.Add(result);

            response = new CommonResponse<Dictionary<string, object>>
            {
                StatusCode = CommonFunction.SUCCESS,
                Message = "Upload file succsessfully.",
                Data = fileUrl,
                size = 0
            };
            return response;
        }
    }
}
