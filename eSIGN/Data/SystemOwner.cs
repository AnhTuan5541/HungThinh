using System;
using System.Collections.Generic;

namespace HungThinh.Data;

public partial class SystemOwner
{
    public int Id { get; set; }

    public int? IdSystem { get; set; }

    public string? IdCard { get; set; }

    public DateTime? CreateAt { get; set; }

    public DateTime? UpdateAt { get; set; }
}
