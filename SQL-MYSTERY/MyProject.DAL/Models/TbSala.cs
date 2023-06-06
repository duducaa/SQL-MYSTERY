using System;
using System.Collections.Generic;

namespace MyProject.DAL.Models;

public partial class TbSala
{
    public uint IdSala { get; set; }

    public string NomeSala { get; set; } = null!;

    public int Capacidade { get; set; }

    public virtual ICollection<TbItem> TbItems { get; set; } = new List<TbItem>();

    public virtual ICollection<TbProgramacao> TbProgramacaos { get; set; } = new List<TbProgramacao>();
}
