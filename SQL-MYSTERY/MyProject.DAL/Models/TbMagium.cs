using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbMagium
{
    public uint IdMagia { get; set; }

    public string? TipoMagia { get; set; }

    public virtual ICollection<TbPersonagem> TbPersonagems { get; set; } = new List<TbPersonagem>();
}
