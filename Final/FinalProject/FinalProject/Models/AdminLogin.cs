using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class AdminLogin
{
    public string UserName { get; set; } = null!;

    public string? Password { get; set; }
}
