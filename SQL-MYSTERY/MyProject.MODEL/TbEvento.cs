using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbEvento
{
    public uint IdEvento { get; set; }

    public string NomeEvento { get; set; } = null!;

    public virtual ICollection<TbContrato> TbContratos { get; set; } = new List<TbContrato>();

    public virtual ICollection<TbConvite> TbConvites { get; set; } = new List<TbConvite>();

    public virtual ICollection<TbProgramacao> TbProgramacaos { get; set; } = new List<TbProgramacao>();
}
