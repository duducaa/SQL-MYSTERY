using System;
using System.Collections.Generic;

namespace MyProject.MODEL;

public partial class TbPersonagem
{
    public uint IdPersonagem { get; set; }

    public string NomePersonagem { get; set; } = null!;

    public string Caf { get; set; } = null!;

    public DateTime DataNascimento { get; set; }

    public uint IdAfiliacao { get; set; }

    public uint IdEspecie { get; set; }

    public uint IdTitulo { get; set; }

    public uint IdMagia { get; set; }

    public uint IdRegiao { get; set; }

    public uint IdPerfil { get; set; }

    public virtual TbAfiliacao IdAfiliacaoNavigation { get; set; } = null!;

    public virtual TbEspecie IdEspecieNavigation { get; set; } = null!;

    public virtual TbMagium IdMagiaNavigation { get; set; } = null!;

    public virtual TbPerfil IdPerfilNavigation { get; set; } = null!;

    public virtual TbRegiao IdRegiaoNavigation { get; set; } = null!;

    public virtual TbTitulo IdTituloNavigation { get; set; } = null!;

    public virtual ICollection<TbContrato> TbContratos { get; set; } = new List<TbContrato>();

    public virtual ICollection<TbConvite> TbConvites { get; set; } = new List<TbConvite>();

    public virtual ICollection<TbDepoimento> TbDepoimentos { get; set; } = new List<TbDepoimento>();

    public virtual ICollection<TbFichaCriminal> TbFichaCriminals { get; set; } = new List<TbFichaCriminal>();

    public virtual TbMorfologium? TbMorfologium { get; set; }

    public virtual TbSolucao? TbSolucao { get; set; }
}
