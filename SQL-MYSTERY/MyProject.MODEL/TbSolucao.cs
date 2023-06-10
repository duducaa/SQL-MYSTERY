using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbSolucao
{
    public uint IdSolucao { get; set; }

    public uint IdCulpado { get; set; }

    public virtual TbPersonagem IdCulpadoNavigation { get; set; } = null!;
}
