using System;
using System.Collections.Generic;

namespace HungThinh.Data;

public partial class Application
{
    public int Id { get; set; }

    /// <summary>
    /// loai don: Improvement, New development
    /// </summary>
    public int? IdType { get; set; }

    public string? IdCardUserRequire { get; set; }

    public string? NameUserRequire { get; set; }

    public string? IdCardUserCreate { get; set; }

    public int? IdSystem { get; set; }

    public string? IdCardSystemOwner { get; set; }

    public string? BussinessJustification { get; set; }

    public string? AdditionalComments { get; set; }

    public DateTime? CreateAt { get; set; }

    public DateTime? UpdateAt { get; set; }

    public string? IdCardManager { get; set; }

    public string? NameManager { get; set; }

    public int? ValueSign { get; set; }

    public string? File { get; set; }

    public string? ApplicationNo { get; set; }

    public int? IdSeverity { get; set; }

    public string? FileName { get; set; }

    public int? IdFactory { get; set; }

    /// <summary>
    /// User danh gia application Tot/Pass : Ko tot/Not Good
    /// </summary>
    public string? UserRateValue { get; set; }

    /// <summary>
    /// User comment danh gia 
    /// </summary>
    public string? UserRateComment { get; set; }

    public int? IdSubSystem { get; set; }
}
