﻿using System;
using System.Collections.Generic;

namespace HungThinh.Data;

public partial class UserRole
{
    public int Id { get; set; }

    public int? IdRole { get; set; }

    public int? IdUser { get; set; }

    public DateTime? CreateAt { get; set; }

    public DateTime? UpdateAt { get; set; }
}
