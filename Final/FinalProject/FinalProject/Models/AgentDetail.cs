using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class AgentDetail
{
    public int Id { get; set; }

    public int? AgentId { get; set; }

    public string? FullName { get; set; }

    public string? Email { get; set; }

    public DateTime? LoginTime { get; set; }

    public DateTime? LogoutTime { get; set; }
}
