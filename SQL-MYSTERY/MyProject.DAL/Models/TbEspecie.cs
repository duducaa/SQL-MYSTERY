using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbEspecie
{
    public uint IdEspecie { get; set; }

    public string NomeEspecie { get; set; } = null!;

    public virtual ICollection<TbPersonagem> TbPersonagems { get; set; } = new List<TbPersonagem>();
}
