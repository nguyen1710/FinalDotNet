using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class Customer
{
    public int CustId { get; set; }

    public string? FullName { get; set; }

    public string? Address { get; set; }

    public string? TypeOfCustomer { get; set; }
}
