using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbProgramacao
{
    public uint IdProgramacao { get; set; }

    public string NomeProgramacao { get; set; } = null!;

    public uint IdSala { get; set; }

    public uint IdEvento { get; set; }

    public TimeSpan HoraInicio { get; set; }

    public TimeSpan HoraFinal { get; set; }

    public virtual TbEvento IdEventoNavigation { get; set; } = null!;

    public virtual TbSala IdSalaNavigation { get; set; } = null!;
}
