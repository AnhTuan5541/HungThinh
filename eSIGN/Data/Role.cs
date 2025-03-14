﻿using System;
using System.Collections.Generic;

namespace HungThinh.Data;

public partial class Role
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public DateTime? CreateAt { get; set; }

    public DateTime? UpdateAt { get; set; }
}
