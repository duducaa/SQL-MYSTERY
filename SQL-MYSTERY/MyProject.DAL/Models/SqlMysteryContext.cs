using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using MyProject.MODEL;

namespace MyProject.DAL.Models;

public partial class SqlMysteryContext : DbContext
{
    public SqlMysteryContext()
    {
    }

    public SqlMysteryContext(DbContextOptions<SqlMysteryContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TbAfiliacao> TbAfiliacaos { get; set; }

    public virtual DbSet<TbCofre> TbCofres { get; set; }

    public virtual DbSet<TbContrato> TbContratos { get; set; }

    public virtual DbSet<TbConvite> TbConvites { get; set; }

    public virtual DbSet<TbDepoimento> TbDepoimentos { get; set; }

    public virtual DbSet<TbDica> TbDicas { get; set; }

    public virtual DbSet<TbEspecie> TbEspecies { get; set; }

    public virtual DbSet<TbEvento> TbEventos { get; set; }

    public virtual DbSet<TbFichaCriminal> TbFichaCriminals { get; set; }

    public virtual DbSet<TbFuncao> TbFuncaos { get; set; }

    public virtual DbSet<TbItem> TbItems { get; set; }

    public virtual DbSet<TbMagium> TbMagia { get; set; }

    public virtual DbSet<TbMorfologium> TbMorfologia { get; set; }

    public virtual DbSet<TbPerfil> TbPerfils { get; set; }

    public virtual DbSet<TbPersonagem> TbPersonagems { get; set; }

    public virtual DbSet<TbProgramacao> TbProgramacaos { get; set; }

    public virtual DbSet<TbRegiao> TbRegiaos { get; set; }

    public virtual DbSet<TbSala> TbSalas { get; set; }

    public virtual DbSet<TbSolucao> TbSolucaos { get; set; }

    public virtual DbSet<TbTitulo> TbTitulos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
=> optionsBuilder.UseMySQL("Server=ServerAdress;Database=DatabaseName;Uid=Username;Pwd=Password;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbAfiliacao>(entity =>
        {
            entity.HasKey(e => e.IdAfiliacao).HasName("PRIMARY");

            entity.ToTable("tb_afiliacao");

            entity.Property(e => e.IdAfiliacao).HasColumnName("ID_AFILIACAO");
            entity.Property(e => e.Afiliacao)
                .HasMaxLength(255)
                .HasColumnName("AFILIACAO");
        });

        modelBuilder.Entity<TbCofre>(entity =>
        {
            entity.HasKey(e => e.IdCofre).HasName("PRIMARY");

            entity.ToTable("tb_cofre");

            entity.Property(e => e.IdCofre).HasColumnName("ID_COFRE");
            entity.Property(e => e.Pista)
                .HasColumnType("text")
                .HasColumnName("PISTA");
            entity.Property(e => e.Senha).HasColumnName("SENHA");
        });

        modelBuilder.Entity<TbContrato>(entity =>
        {
            entity.HasKey(e => e.IdContrato).HasName("PRIMARY");

            entity.ToTable("tb_contrato");

            entity.HasIndex(e => e.IdEvento, "ID_EVENTO");

            entity.HasIndex(e => e.IdFuncao, "ID_FUNCAO");

            entity.HasIndex(e => e.IdPersonagem, "ID_PERSONAGEM");

            entity.Property(e => e.IdContrato).HasColumnName("ID_CONTRATO");
            entity.Property(e => e.IdEvento).HasColumnName("ID_EVENTO");
            entity.Property(e => e.IdFuncao).HasColumnName("ID_FUNCAO");
            entity.Property(e => e.IdPersonagem).HasColumnName("ID_PERSONAGEM");

            entity.HasOne(d => d.IdEventoNavigation).WithMany(p => p.TbContratos)
                .HasForeignKey(d => d.IdEvento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_contrato_ibfk_1");

            entity.HasOne(d => d.IdFuncaoNavigation).WithMany(p => p.TbContratos)
                .HasForeignKey(d => d.IdFuncao)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_contrato_ibfk_3");

            entity.HasOne(d => d.IdPersonagemNavigation).WithMany(p => p.TbContratos)
                .HasForeignKey(d => d.IdPersonagem)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_contrato_ibfk_2");
        });

        modelBuilder.Entity<TbConvite>(entity =>
        {
            entity.HasKey(e => e.IdConvite).HasName("PRIMARY");

            entity.ToTable("tb_convite");

            entity.HasIndex(e => e.IdEvento, "ID_EVENTO");

            entity.HasIndex(e => e.IdPersonagem, "ID_PERSONAGEM");

            entity.Property(e => e.IdConvite).HasColumnName("ID_CONVITE");
            entity.Property(e => e.Confirmacao).HasColumnName("CONFIRMACAO");
            entity.Property(e => e.IdEvento).HasColumnName("ID_EVENTO");
            entity.Property(e => e.IdPersonagem).HasColumnName("ID_PERSONAGEM");

            entity.HasOne(d => d.IdEventoNavigation).WithMany(p => p.TbConvites)
                .HasForeignKey(d => d.IdEvento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_convite_ibfk_1");

            entity.HasOne(d => d.IdPersonagemNavigation).WithMany(p => p.TbConvites)
                .HasForeignKey(d => d.IdPersonagem)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_convite_ibfk_2");
        });

        modelBuilder.Entity<TbDepoimento>(entity =>
        {
            entity.HasKey(e => e.IdDepoimento).HasName("PRIMARY");

            entity.ToTable("tb_depoimento");

            entity.HasIndex(e => e.IdPersonagem, "ID_PERSONAGEM_TESTEMUNHAS_FK");

            entity.Property(e => e.IdDepoimento).HasColumnName("ID_DEPOIMENTO");
            entity.Property(e => e.Depoimento)
                .HasColumnType("text")
                .HasColumnName("DEPOIMENTO");
            entity.Property(e => e.IdPersonagem).HasColumnName("ID_PERSONAGEM");

            entity.HasOne(d => d.IdPersonagemNavigation).WithMany(p => p.TbDepoimentos)
                .HasForeignKey(d => d.IdPersonagem)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("ID_PERSONAGEM_TESTEMUNHAS_FK");
        });

        modelBuilder.Entity<TbDica>(entity =>
        {
            entity.HasKey(e => e.IdDica).HasName("PRIMARY");

            entity.ToTable("tb_dica");

            entity.Property(e => e.IdDica).HasColumnName("ID_DICA");
            entity.Property(e => e.Dica)
                .HasColumnType("text")
                .HasColumnName("DICA");
        });

        modelBuilder.Entity<TbEspecie>(entity =>
        {
            entity.HasKey(e => e.IdEspecie).HasName("PRIMARY");

            entity.ToTable("tb_especie");

            entity.Property(e => e.IdEspecie).HasColumnName("ID_ESPECIE");
            entity.Property(e => e.NomeEspecie)
                .HasMaxLength(255)
                .HasColumnName("NOME_ESPECIE");
        });

        modelBuilder.Entity<TbEvento>(entity =>
        {
            entity.HasKey(e => e.IdEvento).HasName("PRIMARY");

            entity.ToTable("tb_evento");

            entity.Property(e => e.IdEvento).HasColumnName("ID_EVENTO");
            entity.Property(e => e.NomeEvento)
                .HasMaxLength(255)
                .HasColumnName("NOME_EVENTO");
        });

        modelBuilder.Entity<TbFichaCriminal>(entity =>
        {
            entity.HasKey(e => e.IdCrime).HasName("PRIMARY");

            entity.ToTable("tb_ficha_criminal");

            entity.HasIndex(e => e.IdPersonagem, "ID_PERSONAGEM_CRIME_FK");

            entity.Property(e => e.IdCrime).HasColumnName("ID_CRIME");
            entity.Property(e => e.Crime)
                .HasColumnType("enum('ASSASSINATO','ROUBO','MAGIA DAS TREVAS','ALQUIMIA PROIBIDA','ESPIONAGEM','CORRUPIÇÃO','CONTRABANDO')")
                .HasColumnName("CRIME");
            entity.Property(e => e.FimPena)
                .HasColumnType("date")
                .HasColumnName("FIM_PENA");
            entity.Property(e => e.IdPersonagem).HasColumnName("ID_PERSONAGEM");
            entity.Property(e => e.InicioPena)
                .HasColumnType("date")
                .HasColumnName("INICIO_PENA");
            entity.Property(e => e.Status)
                .HasColumnType("enum('PRESO','LIVRE')")
                .HasColumnName("STATUS");

            entity.HasOne(d => d.IdPersonagemNavigation).WithMany(p => p.TbFichaCriminals)
                .HasForeignKey(d => d.IdPersonagem)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("ID_PERSONAGEM_CRIME_FK");
        });

        modelBuilder.Entity<TbFuncao>(entity =>
        {
            entity.HasKey(e => e.IdFuncao).HasName("PRIMARY");

            entity.ToTable("tb_funcao");

            entity.Property(e => e.IdFuncao).HasColumnName("ID_FUNCAO");
            entity.Property(e => e.NomeFuncao)
                .HasMaxLength(255)
                .HasColumnName("NOME_FUNCAO");
        });

        modelBuilder.Entity<TbItem>(entity =>
        {
            entity.HasKey(e => e.IdItem).HasName("PRIMARY");

            entity.ToTable("tb_item");

            entity.HasIndex(e => e.IdSala, "ID_SALA_ITENS_FK");

            entity.Property(e => e.IdItem).HasColumnName("ID_ITEM");
            entity.Property(e => e.IdSala).HasColumnName("ID_SALA");
            entity.Property(e => e.NomeItem)
                .HasMaxLength(255)
                .HasColumnName("NOME_ITEM");

            entity.HasOne(d => d.IdSalaNavigation).WithMany(p => p.TbItems)
                .HasForeignKey(d => d.IdSala)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("ID_SALA_ITENS_FK");
        });

        modelBuilder.Entity<TbMagium>(entity =>
        {
            entity.HasKey(e => e.IdMagia).HasName("PRIMARY");

            entity.ToTable("tb_magia");

            entity.Property(e => e.IdMagia).HasColumnName("ID_MAGIA");
            entity.Property(e => e.TipoMagia)
                .HasMaxLength(255)
                .HasColumnName("TIPO_MAGIA");
        });

        modelBuilder.Entity<TbMorfologium>(entity =>
        {
            entity.HasKey(e => e.IdAparencia).HasName("PRIMARY");

            entity.ToTable("tb_morfologia");

            entity.HasIndex(e => e.IdPersonagem, "ID_PERSONAGEM").IsUnique();

            entity.Property(e => e.IdAparencia).HasColumnName("ID_APARENCIA");
            entity.Property(e => e.Altura).HasColumnName("ALTURA");
            entity.Property(e => e.IdPersonagem).HasColumnName("ID_PERSONAGEM");
            entity.Property(e => e.Olhos)
                .HasMaxLength(255)
                .HasColumnName("OLHOS");
            entity.Property(e => e.Pelo)
                .HasMaxLength(255)
                .HasColumnName("PELO");

            entity.HasOne(d => d.IdPersonagemNavigation).WithOne(p => p.TbMorfologium)
                .HasForeignKey<TbMorfologium>(d => d.IdPersonagem)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("ID_PERSONAGEM_MORFOLOGIA_FK");
        });

        modelBuilder.Entity<TbPerfil>(entity =>
        {
            entity.HasKey(e => e.IdPerfil).HasName("PRIMARY");

            entity.ToTable("tb_perfil");

            entity.Property(e => e.IdPerfil).HasColumnName("ID_PERFIL");
            entity.Property(e => e.NomePerfil)
                .HasMaxLength(255)
                .HasColumnName("NOME_PERFIL");
        });

        modelBuilder.Entity<TbPersonagem>(entity =>
        {
            entity.HasKey(e => e.IdPersonagem).HasName("PRIMARY");

            entity.ToTable("tb_personagem");

            entity.HasIndex(e => e.Caf, "CAF").IsUnique();

            entity.HasIndex(e => e.IdAfiliacao, "ID_AFILIACAO");

            entity.HasIndex(e => e.IdEspecie, "ID_ESPECIE");

            entity.HasIndex(e => e.IdMagia, "ID_MAGIA");

            entity.HasIndex(e => e.IdPerfil, "ID_PERFIL");

            entity.HasIndex(e => e.IdRegiao, "ID_REGIAO");

            entity.HasIndex(e => e.IdTitulo, "ID_TITULO");

            entity.Property(e => e.IdPersonagem).HasColumnName("ID_PERSONAGEM");
            entity.Property(e => e.Caf).HasColumnName("CAF");
            entity.Property(e => e.DataNascimento)
                .HasColumnType("date")
                .HasColumnName("DATA_NASCIMENTO");
            entity.Property(e => e.IdAfiliacao).HasColumnName("ID_AFILIACAO");
            entity.Property(e => e.IdEspecie).HasColumnName("ID_ESPECIE");
            entity.Property(e => e.IdMagia).HasColumnName("ID_MAGIA");
            entity.Property(e => e.IdPerfil).HasColumnName("ID_PERFIL");
            entity.Property(e => e.IdRegiao).HasColumnName("ID_REGIAO");
            entity.Property(e => e.IdTitulo).HasColumnName("ID_TITULO");
            entity.Property(e => e.NomePersonagem)
                .HasMaxLength(255)
                .HasColumnName("NOME_PERSONAGEM");

            entity.HasOne(d => d.IdAfiliacaoNavigation).WithMany(p => p.TbPersonagems)
                .HasForeignKey(d => d.IdAfiliacao)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_personagem_ibfk_6");

            entity.HasOne(d => d.IdEspecieNavigation).WithMany(p => p.TbPersonagems)
                .HasForeignKey(d => d.IdEspecie)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_personagem_ibfk_2");

            entity.HasOne(d => d.IdMagiaNavigation).WithMany(p => p.TbPersonagems)
                .HasForeignKey(d => d.IdMagia)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_personagem_ibfk_3");

            entity.HasOne(d => d.IdPerfilNavigation).WithMany(p => p.TbPersonagems)
                .HasForeignKey(d => d.IdPerfil)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_personagem_ibfk_1");

            entity.HasOne(d => d.IdRegiaoNavigation).WithMany(p => p.TbPersonagems)
                .HasForeignKey(d => d.IdRegiao)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_personagem_ibfk_5");

            entity.HasOne(d => d.IdTituloNavigation).WithMany(p => p.TbPersonagems)
                .HasForeignKey(d => d.IdTitulo)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_personagem_ibfk_4");
        });

        modelBuilder.Entity<TbProgramacao>(entity =>
        {
            entity.HasKey(e => e.IdProgramacao).HasName("PRIMARY");

            entity.ToTable("tb_programacao");

            entity.HasIndex(e => e.IdEvento, "ID_EVENTO");

            entity.HasIndex(e => e.IdSala, "ID_SALA");

            entity.Property(e => e.IdProgramacao).HasColumnName("ID_PROGRAMACAO");
            entity.Property(e => e.HoraFinal)
                .HasColumnType("time")
                .HasColumnName("HORA_FINAL");
            entity.Property(e => e.HoraInicio)
                .HasColumnType("time")
                .HasColumnName("HORA_INICIO");
            entity.Property(e => e.IdEvento).HasColumnName("ID_EVENTO");
            entity.Property(e => e.IdSala).HasColumnName("ID_SALA");
            entity.Property(e => e.NomeProgramacao)
                .HasMaxLength(255)
                .HasColumnName("NOME_PROGRAMACAO");

            entity.HasOne(d => d.IdEventoNavigation).WithMany(p => p.TbProgramacaos)
                .HasForeignKey(d => d.IdEvento)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_programacao_ibfk_2");

            entity.HasOne(d => d.IdSalaNavigation).WithMany(p => p.TbProgramacaos)
                .HasForeignKey(d => d.IdSala)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("tb_programacao_ibfk_1");
        });

        modelBuilder.Entity<TbRegiao>(entity =>
        {
            entity.HasKey(e => e.IdRegiao).HasName("PRIMARY");

            entity.ToTable("tb_regiao");

            entity.Property(e => e.IdRegiao).HasColumnName("ID_REGIAO");
            entity.Property(e => e.NomeRegiao)
                .HasMaxLength(255)
                .HasColumnName("NOME_REGIAO");
        });

        modelBuilder.Entity<TbSala>(entity =>
        {
            entity.HasKey(e => e.IdSala).HasName("PRIMARY");

            entity.ToTable("tb_sala");

            entity.Property(e => e.IdSala).HasColumnName("ID_SALA");
            entity.Property(e => e.Capacidade).HasColumnName("CAPACIDADE");
            entity.Property(e => e.NomeSala)
                .HasMaxLength(255)
                .HasColumnName("NOME_SALA");
        });

        modelBuilder.Entity<TbSolucao>(entity =>
        {
            entity.HasKey(e => e.IdSolucao).HasName("PRIMARY");

            entity.ToTable("tb_solucao");

            entity.HasIndex(e => e.EspecieAssassino, "ESPECIE_ASSASSINO").IsUnique();

            entity.HasIndex(e => e.NomeAssassino, "NOME_ASSASSINO").IsUnique();

            entity.Property(e => e.IdSolucao).HasColumnName("ID_SOLUCAO");
            entity.Property(e => e.EspecieAssassino).HasColumnName("ESPECIE_ASSASSINO");
            entity.Property(e => e.NomeAssassino).HasColumnName("NOME_ASSASSINO");
        });

        modelBuilder.Entity<TbTitulo>(entity =>
        {
            entity.HasKey(e => e.IdTitulo).HasName("PRIMARY");

            entity.ToTable("tb_titulo");

            entity.Property(e => e.IdTitulo).HasColumnName("ID_TITULO");
            entity.Property(e => e.TipoTitulo)
                .HasMaxLength(255)
                .HasColumnName("TIPO_TITULO");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
