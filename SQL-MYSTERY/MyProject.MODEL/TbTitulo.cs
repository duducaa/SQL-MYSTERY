using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbTitulo
{
    public uint IdTitulo { get; set; }

    public string? TipoTitulo { get; set; }

    public virtual ICollection<TbPersonagem> TbPersonagems { get; set; } = new List<TbPersonagem>();
}
