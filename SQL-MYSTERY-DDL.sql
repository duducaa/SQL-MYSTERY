#CRIAR BANCO DE DADOS
DROP DATABASE sql_mystery;

CREATE DATABASE SQL_MYSTERY;
USE  SQL_MYSTERY;

#TABELAS DO JOGO SQL MYSTERY

#CONVIDADOS DO CASAMENTO
CREATE TABLE TB_PERFIL (
  ID_PERFIL INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NOME_PERFIL VARCHAR(255),
  CHECK (UPPER(NOME_PERFIL) IN ('CONVIDADO', 'FUNCIONÁRIO'))
);

#INSERT DOS TIPOS DE PERFIS DA FESTA
INSERT INTO TB_PERFIL VALUES 
	(1, 'CONVIDADO'),
  (2, 'FUNCIONÁRIO');

#TABELA DAS ESPECIES DOS PERSOONAGENS DO JOGO 
CREATE TABLE TB_ESPECIE (
	ID_ESPECIE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  NOME_ESPECIE VARCHAR(255) NOT NULL
);

#INSERT DAS ESPECIES DO REINO
INSERT INTO TB_ESPECIE VALUES
    (1, 'Onça-pintada'),
    (2, 'Arara-azul'),
    (3, 'Tamanduá-bandeira'),
    (4, 'Tucano'),
    (5, 'Jaguatirica'),
    (6, 'Mico-leão-dourado'),
    (7, 'Anta'),
    (8, 'Papagaio-verdadeiro'),
    (9, 'Piranha'),
    (10, 'Jabuti'),
    (11, 'Capivara'),
    (12, 'Sagui'),
    (13, 'Tamanduá-mirim'),
    (14, 'Suçuarana'),
    (15, 'Jacaré-açu'),
    (16, 'Boto-cor-de-rosa'),
    (17, 'Tatu-canastra'),
    (18, 'Gavião-real'),
    (19, 'Veado-catingueiro'),
    (20, 'Tatu-bola'),
    (21, 'Sapo-cururu'),
    (22, 'Mico-estrela'),
    (23, 'Cobra-coral'),
    (24, 'Lobo-guará'),
    (25, 'Pavãozinho-do-Pará'),
    (26, 'Bicho-preguiça'),
    (27, 'Cachorro-vinagre'),
    (28, 'Peixe-boi'),
    (29, 'Carcará'),
    (30, 'Sabiá-laranjeira'),
    (31, 'Harpia'),
    (32, 'Rato-do-mato'),
    (33, 'Pirarucu');


#TABELA DAS MAGIAS DO REINO
CREATE TABLE TB_MAGIA (
	ID_MAGIA INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TIPO VARCHAR(255)
);

#INSERT DE MAGIAS
INSERT INTO TB_MAGIA VALUES
	  (1, 'AR'),
    (2, 'ÁGUA'),
    (3, 'TERRA'),
    (4, 'FOGO'),
    (5, 'TREVAS'),
    (6, 'FLORESTA'),
    (7, 'LUZ'),
    (8, 'ALQUIMÍA'),
    (9, 'ESPAÇO'),
    (10, 'MATÉRIA'),
    (11, 'TEMPO');

#TABELA DOS TITULOS DE NOBRESA 
CREATE TABLE TB_TITULO (
	ID_TITULO INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TIPO VARCHAR(255)
);

#INSERT DOS TITULOS DE NOBRESA 
INSERT INTO TB_TITULO VALUES
	  (1, 'BARÃO'),
    (2, 'VISCONDE'),
    (3, 'FAMÍLIA REAL'),
    (4, 'DUQUE'),
    (5, 'MARQUÊS'),
    (6, 'CONDE'),
    (7, 'BARONETE'),
    (8, 'CAVALEIRO');

CREATE TABLE TB_REGIAO (
  ID_REGIAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  NOME_REGIAO VARCHAR(255)
);

INSERT INTO TB_REGIAO VALUES
	(1, 'Norte'),
    (2, 'Sul'),
    (3, 'Leste'),
    (4, 'Oeste'),
    (5, 'Centro');


#CARTÓRIO DO MUNDO ANIMAL
CREATE TABLE TB_PERSONAGEM (
  ID_PERSONAGEM INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NOME_PERSONAGEM VARCHAR(255) NOT NULL,
  CAF VARCHAR(255) NOT NULL UNIQUE, #CAF (COMPROVANTE DE ANIMAL FISICO)
  DATA_NASCIMENTO DATE NOT NULL,
  AFILIACAO VARCHAR(255) NOT NULL,
  ID_ESPECIE INT  UNSIGNED NOT NULL,
  ID_TITULO INT  UNSIGNED  NOT NULL,
  ID_MAGIA INT  UNSIGNED  NOT NULL,
  ID_REGIAO INT  UNSIGNED  NOT NULL,
  ID_PERFIL INT  UNSIGNED  NOT NULL,
  FOREIGN KEY (ID_PERFIL) REFERENCES TB_PERFIL(ID_PERFIL),
  FOREIGN KEY (ID_ESPECIE) REFERENCES TB_ESPECIE(ID_ESPECIE),
  FOREIGN KEY (ID_MAGIA) REFERENCES TB_MAGIA(ID_MAGIA),
  FOREIGN KEY (ID_TITULO) REFERENCES TB_TITULO(ID_TITULO), 
  FOREIGN KEY (ID_REGIAO) REFERENCES TB_REGIAO(ID_REGIAO)
);

#TABELA COM AS SALAS DOS EVENTOS
CREATE TABLE TB_SALA (
  ID_SALA INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  NOME_SALA VARCHAR(255) NOT NULL,
  CAPACIDADE INT NOT NULL
);

#INSERT DOS NOMES DAS SALAS
INSERT INTO TB_SALA VALUES
    (1, 'Hall de Entrada', 20),
    (2, 'Sala de Estar', 25),
    (3, 'Sala de Jantar', 18),
    (4, 'Cozinha', 10),
    (5, 'Escritório', 8),
    (6, 'Biblioteca', 30),
    (7, 'Sala de Música', 15),
    (8, 'Sala de Jogos', 20),
    (9, 'Salão de Festas', 100),
    (10, 'Quarto Principal', 2),
    (11, 'Quarto de Hóspedes', 4),
    (12, 'Banheiro Principal', 1),
    (13, 'Banheiro de Hóspedes', 1),
    (14, 'Sótão', 10),
    (15, 'Jardim de Inverno', 15),
    (16, 'Capela', 50);


#TABELA ITENS
CREATE TABLE TB_ITEM (
	ID_ITEM INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	NOME_ITEM VARCHAR(255) NOT NULL,
	ID_SALA INT UNSIGNED NOT NULL,
	CONSTRAINT ID_SALA_ITENS_FK FOREIGN KEY (ID_SALA) REFERENCES TB_SALA(ID_SALA)
);

#INSERT DOS ITENS DAS SALAS
INSERT INTO TB_ITEM VALUES
    (1, 'Tapetes Voadores', 1),
    (2, 'Espelho do Esquecimento', 1),
    (3, 'Lâmpada da Ilusão', 1),
    (4, 'Sofá dos Sonhos', 2),
    (5, 'Poltronas Encantadas', 2),
    (6, 'Tela da Transformação', 2),
    (7, 'Mesa Banqueteira', 3),
    (8, 'Taças Envenenadas', 3),
    (9, 'Talheres Hipnóticos', 3),
    (10, 'Panela de Desejos', 4),
    (11, 'Faca do Destino', 4),
    (12, 'Frigideira da Petrificação', 4),
    (13, 'Caneta da Criatividade', 5),
    (14, 'Livro dos Feitiços Proibidos', 5),
    (15, 'Cadeira da Destruição', 5),
    (16, 'Pergaminho da Sabedoria', 6),
    (17, 'Livro das Sombras', 6),
    (18, 'Estante Armadilha', 6),
    (19, 'Flauta Encantadora', 7),
    (20, 'Trompete do Trovão', 7),
    (21, 'Bateria Explosiva', 7),
    (22, 'Tabuleiro da Ilusão', 8),
    (23, 'Dardos Envenenados', 8),
    (24, 'Baralho Maldito', 8),
    (25, 'Bola de Discoteca Hipnótica', 9),
    (26, 'Coquetel de Veneno', 9),
    (27, 'Fogos de Artifício Mágicos', 9),
    (28, 'Cama do Descanso Eterno', 10),
    (29, 'Espelho da Ilusão Mortal', 10),
    (30, 'Abajur da Escuridão', 10),
    (31, 'Travesseiro do Sono Profundo', 11),
    (32, 'Tapete Voador Assassino', 11),
    (33, 'Relógio do Tempo Descontrolado', 11),
    (34, 'Tapete de Banho Aquecido', 12),
    (35, 'Sabonete Explosivo', 12),
    (36, 'Escova de Dentes do Azar', 12),
    (37, 'Toalha de Banho Transformadora', 13),
    (38, 'Banheira do Afogamento Ilusório', 13),
    (39, 'Vaso Sanitário Explosivo', 13),
    (40, 'Baú dos Segredos', 14),
    (41, 'Aranhas da Maldição', 14),
    (42, 'Vassoura Voadora da Destruição', 14),
    (43, 'Plantas Cantantes', 15),
    (44, 'Rosa do Sono Profundo', 15),
    (45, 'Estátua do Gelo Eterno', 15),
    (46, 'Velas do Encantamento', 16),
    (47, 'Livro Sagrado da Condenação', 16),
    (48, 'Órgão das Almas Perdidas', 16);

#TABELA  TESTEMUNHAS
CREATE TABLE TB_DEPOIMENTO (
  ID_DEPOIMENTO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_PERSONAGEM INT UNSIGNED NOT NULL,
  DEPOIMENTO TEXT NOT NULL,
  CONSTRAINT ID_PERSONAGEM_TESTEMUNHAS_FK FOREIGN KEY (ID_PERSONAGEM) REFERENCES TB_PERSONAGEM(ID_PERSONAGEM)
);

#TABELA DE SOLUÇÃO PARA VALIDAR O SUSPEITO
CREATE TABLE TB_SOLUCAO (
  ID_SOLUCAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  NOME_ASSASSINO VARCHAR(255) NOT NULL UNIQUE,
  ESPECIE_ASSASSINO VARCHAR(255) NOT NULL UNIQUE
);

#SEGREDO PARA AUXILIAR NA SOLUÇÃO
CREATE TABLE TB_COFRE(
  ID_COFRE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  SENHA INT NOT NULL,
  PISTA TEXT
);

#FICHAS CRIMINAIS DO REINO
CREATE TABLE TB_FICHA_CRIMINAL(
  ID_CRIME INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_PERSONAGEM INT UNSIGNED NOT NULL,
  CRIME ENUM('ASSASSINATO','ROUBO','MAGIA DAS TREVAS','ALQUIMIA PROIBIDA','ESPIONAGEM','CORRUPIÇÃO','CONTRABANDO'),
  INICIO_PENA DATE NOT NULL,
  FIM_PENA DATE NOT NULL,
  STATUS ENUM('PRESO','LIVRE') NOT NULL,
  CONSTRAINT ID_PERSONAGEM_CRIME_FK FOREIGN KEY (ID_PERSONAGEM) REFERENCES TB_PERSONAGEM(ID_PERSONAGEM)
);

#CARACTERISTICAS FISICAS DOS PERSONAGENS
CREATE TABLE TB_MORFOLOGIA(
  ID_APARENCIA INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_PERSONAGEM INT UNSIGNED NOT NULL UNIQUE,
  PELO VARCHAR(255),
  OLHOS VARCHAR(255) NOT NULL,
  ALTURA FLOAT NOT NULL,
  CONSTRAINT ID_PERSONAGEM_MORFOLOGIA_FK FOREIGN KEY (ID_PERSONAGEM) REFERENCES TB_PERSONAGEM(ID_PERSONAGEM)
);

#DICAS DO PERSONAGEM SECUNDARIO 
CREATE TABLE TB_DICA (
  ID_DICA INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  DICA TEXT NOT NULL
);

#TABELA DO EVENTO DO CASAMENTO 
CREATE TABLE TB_EVENTO (
	ID_EVENTO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    NOME_EVENTO VARCHAR(255) NOT NULL
);

#INSERT DO CASAMENTO NA TABELA CASAMENTO
INSERT INTO TB_EVENTO VALUES
	(1, 'CASAMENTO');

#PROGRAMAÇÕES DO EVENTO
CREATE TABLE TB_PROGRAMACAO (
  ID_PROGRAMACAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  NOME_PROGRAMACAO VARCHAR(255) NOT NULL,
  ID_SALA INT UNSIGNED NOT NULL, 
  ID_EVENTO INT UNSIGNED NOT NULL,
  HORA_INICIO TIME NOT NULL,
  HORA_FINAL TIME NOT NULL,
  FOREIGN KEY (ID_SALA) REFERENCES TB_SALA(ID_SALA),
  FOREIGN KEY (ID_EVENTO) REFERENCES TB_EVENTO(ID_EVENTO)
);
#INSERT DA PROGRAMAÇÃO DO CASAMENTO
INSERT INTO TB_PROGRAMACAO VALUES
    (1, 'Preparação da Noiva', 10, 1, '09:00', '11:40'),
    (2, 'Preparação do Noivo', 10, 1, '12:00', '12:30'),
    (3, 'Almoço', 3, 1, '13:00', '14:00'),
    (4, 'Cerimônia de Casamento', 16, 1, '15:00', '16:00'),
    (5, 'Sessão de Fotos dos Noivos', 15, 1, '16:00', '16:30'),
    (6, 'Jantar de Casamento', 3, 1, '16:30', '17:30'),
    (7, 'Brinde de Casamento', 3, 1, '17:30', '18:00'),
    (9, 'Corte do Bolo', 9, 1, '17:30', '18:00'),
    (10, 'Discurso dos Padrinhos', 9, 1, '18:00', '18:30'),
    (11, 'Primeira Dança dos Noivos', 9, 1, '18:00', '19:00'),
    (12, 'Banda', 9, 1, '19:00', '20:00'),
    (13, 'Baile de Casamento', 9, 1, '20:00', '21:00'),
    (14, 'Lançamento do Buquê', 9, 1, '21:00', '21:30'),
    (15, 'Festa de Casamento', 16, 1, '21:30', '00:00'),
    (16, 'Entrega dos Presentes', 9, 1, '00:00', '01:30'),
    (17, 'Despedida dos Noivos', 1, 1, '01:40', '02:30');

CREATE TABLE TB_CONVITE (
	ID_CONVITE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_EVENTO INT UNSIGNED NOT NULL,
    ID_PERSONAGEM INT UNSIGNED NOT NULL,
    CONFIRMACAO BOOL,
    FOREIGN KEY (ID_EVENTO) REFERENCES TB_EVENTO(ID_EVENTO),
    FOREIGN KEY (ID_PERSONAGEM) REFERENCES TB_PERSONAGEM(ID_PERSONAGEM)
);


USE SQL_MYSTERY;

DELIMITER $

#SÓ PODE ADICINAR NA TB_CONVITE OS PERSONAGENS CONVIDADOS DA TB_PERFIL
CREATE TRIGGER TG_CONVITE_PERSONAGEM
BEFORE INSERT
ON TB_CONVITE
FOR EACH ROW
BEGIN
	DECLARE vPerfil TEXT;
    SET vPerfil = (
		SELECT
			PL.NOME
		FROM
			TB_PERSONAGEM PM
		INNER JOIN
			TB_PERFIL PL
		ON
			PL.ID_PERFIL = PM.ID_PERFIL
		WHERE
			PM.ID_PERSONAGEM = NEW.ID_PERSONAGEM
    );
    
    IF UPPER(vPerfil) != 'CONVIDADO' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ESSE PERSONAGEM É FUNCIONÁRIO';     
   END IF;
END

$ DELIMITER ;