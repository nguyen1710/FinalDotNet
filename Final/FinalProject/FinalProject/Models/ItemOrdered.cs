using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class ItemOrdered
{
    public int Id { get; set; }

    public int? OrderId { get; set; }

    public int? ProductId { get; set; }

    public int? Quantity { get; set; }

    public decimal? TotalPriceOfItem { get; set; }
}
