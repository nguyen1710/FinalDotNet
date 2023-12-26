using System;
using System.Collections.Generic;

namespace FinalProject.Models;

public partial class ItemCatalog
{
    public int ProductId { get; set; }

    public string? ProductName { get; set; }

    public string? BarCode { get; set; }

    public decimal? ImportPrice { get; set; }

    public decimal? RetailPrice { get; set; }

    public string? Category { get; set; }

    public DateTime? CreationDate { get; set; }
}
