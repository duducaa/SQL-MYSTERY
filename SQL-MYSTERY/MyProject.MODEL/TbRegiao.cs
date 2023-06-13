using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbRegiao
{
    public uint IdRegiao { get; set; }

    public string? NomeRegiao { get; set; }

    public virtual ICollection<TbPersonagem> TbPersonagems { get; set; } = new List<TbPersonagem>();
}
