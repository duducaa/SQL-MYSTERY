using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbPerfil
{
    public uint IdPerfil { get; set; }

    public string? NomePerfil { get; set; }

    public virtual ICollection<TbPersonagem> TbPersonagems { get; set; } = new List<TbPersonagem>();
}
