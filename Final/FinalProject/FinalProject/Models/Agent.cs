using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class Agent
{
    public int AgentId { get; set; }

    public string? UserName { get; set; }

    public string? Password { get; set; }

    public string? Role { get; set; }
}
