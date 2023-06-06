using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbConvite
{
    public uint IdConvite { get; set; }

    public uint IdEvento { get; set; }

    public uint IdPersonagem { get; set; }

    public bool? Confirmacao { get; set; }

    public virtual TbEvento IdEventoNavigation { get; set; } = null!;

    public virtual TbPersonagem IdPersonagemNavigation { get; set; } = null!;
}
