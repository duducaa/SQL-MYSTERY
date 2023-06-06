using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbAfiliacao
{
    public uint IdAfiliacao { get; set; }

    public string Afiliacao { get; set; } = null!;

    public virtual ICollection<TbPersonagem> TbPersonagems { get; set; } = new List<TbPersonagem>();
}
