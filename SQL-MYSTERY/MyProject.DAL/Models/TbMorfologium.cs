using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbMorfologium
{
    public uint IdAparencia { get; set; }

    public uint IdPersonagem { get; set; }

    public string? Pelo { get; set; }

    public string Olhos { get; set; } = null!;

    public float Altura { get; set; }

    public virtual TbPersonagem IdPersonagemNavigation { get; set; } = null!;
}
