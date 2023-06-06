using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbCofre
{
    public uint IdCofre { get; set; }

    public int Senha { get; set; }

    public string? Pista { get; set; }
}
