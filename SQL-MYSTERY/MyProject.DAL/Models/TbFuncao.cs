using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbFuncao
{
    public uint IdFuncao { get; set; }

    public string? NomeFuncao { get; set; }

    public virtual ICollection<TbContrato> TbContratos { get; set; } = new List<TbContrato>();
}
