using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbContrato
{
    public uint IdContrato { get; set; }

    public uint IdEvento { get; set; }

    public uint IdPersonagem { get; set; }

    public uint IdFuncao { get; set; }

    public virtual TbEvento IdEventoNavigation { get; set; } = null!;

    public virtual TbFuncao IdFuncaoNavigation { get; set; } = null!;

    public virtual TbPersonagem IdPersonagemNavigation { get; set; } = null!;
}
