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
        [Route("linh-vuc/chi-tiet")]
        public IActionResult LinhVucChiTiet()
        {
            return View();
        }
        [Route("du-an")]
        public IActionResult DuAn()
        {
            return View();
        }
        [Route("du-an/chi-tiet")]
        public IActionResult DuAnChiTiet()
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
        [Route("tin-tuc/chi-tiet")]
        public IActionResult TinTucChiTiet()
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
    }
}
