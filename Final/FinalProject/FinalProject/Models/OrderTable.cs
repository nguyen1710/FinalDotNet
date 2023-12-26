using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class OrderTable
{
    public int OrderId { get; set; }

    public DateTime? OrderDate { get; set; }

    public int? CustId { get; set; }

    public decimal? TotalPriceOfOrder { get; set; }

    public decimal? MoneyReceived { get; set; }

    public decimal? MoneyRefund { get; set; }
}
