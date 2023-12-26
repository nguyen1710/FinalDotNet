using FinalProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProject.Controllers
{
    public class ManageAdministratorController : Controller
    {
        FinalDotNetContext context = new FinalDotNetContext();
        public IActionResult Index()
        {
            var result = from ad in context.AgentDetails
                         join ag in context.Agents on ad.AgentId equals ag.AgentId
                         select new
                         {
                             AgentDetail = ad,
                             Agent = ag
                         };
            ViewBag.AgentTable = result.Select(data => new
            {
                AgentId = data.AgentDetail.AgentId,
                FullName = data.AgentDetail.FullName,
                Email = data.AgentDetail.Email,
                UserName = data.Agent.UserName,
                Password = data.Agent.Password,
                Role = data.Agent.Role
            });

            return View();
        
        }

        public IActionResult EditRole() {
            return View();
        }
    }
}
