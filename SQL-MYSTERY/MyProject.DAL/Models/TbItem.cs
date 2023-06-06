using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbItem
{
    public uint IdItem { get; set; }

    public string NomeItem { get; set; } = null!;

    public uint IdSala { get; set; }

    public virtual TbSala IdSalaNavigation { get; set; } = null!;
}
