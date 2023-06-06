using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbFichaCriminal
{
    public uint IdCrime { get; set; }

    public uint IdPersonagem { get; set; }

    public string? Crime { get; set; }

    public DateTime InicioPena { get; set; }

    public DateTime FimPena { get; set; }

    public string Status { get; set; } = null!;

    public virtual TbPersonagem IdPersonagemNavigation { get; set; } = null!;
}
