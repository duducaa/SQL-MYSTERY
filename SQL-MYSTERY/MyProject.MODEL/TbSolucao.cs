using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbSolucao
{
    public uint IdSolucao { get; set; }

    public string NomeAssassino { get; set; } = null!;

    public string EspecieAssassino { get; set; } = null!;
}
