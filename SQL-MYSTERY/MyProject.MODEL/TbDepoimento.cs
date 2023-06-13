using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbDepoimento
{
    public uint IdDepoimento { get; set; }

    public uint IdPersonagem { get; set; }

    public string Depoimento { get; set; } = null!;

    public virtual TbPersonagem IdPersonagemNavigation { get; set; } = null!;
}
