using System;
using System.Collections.Generic;

namespace HungThinh.Data;

public partial class Severity
{
    public int Id { get; set; }

    public string? Severity1 { get; set; }

    public string? Description { get; set; }

    public DateTime? CreateAt { get; set; }

    public string? UpdateAt { get; set; }
}
