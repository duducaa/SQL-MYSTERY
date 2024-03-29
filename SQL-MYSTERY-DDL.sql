#CRIAR BANCO DE DADOS
DROP DATABASE IF EXISTS sql_mystery;

CREATE DATABASE SQL_MYSTERY;
USE  SQL_MYSTERY;

#TABELAS DO JOGO SQL MYSTERY

#CONVIDADOS DO CASAMENTO
CREATE TABLE PERFIL (
  ID_PERFIL INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  PERFIL VARCHAR(255)
);

#TABELA DAS ESPECIES DOS PERSOONAGENS DO JOGO 
CREATE TABLE ESPECIE (
	ID_ESPECIE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ESPECIE VARCHAR(255) NOT NULL
);

#TABELA DAS MAGIAS DO REINO
CREATE TABLE MAGIA (
	ID_MAGIA INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TIPO_MAGIA VARCHAR(255)
);

#TABELA DOS TITULOS DE NOBRESA 
CREATE TABLE TITULO (
	ID_TITULO INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TIPO_TITULO VARCHAR(255)
);

CREATE TABLE REGIAO (
  ID_REGIAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  REGIAO VARCHAR(255)
);

CREATE TABLE AFILIACAO (
  ID_AFILIACAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  AFILIACAO VARCHAR(255) NOT NULL
);

#CARTÓRIO DO MUNDO ANIMAL
CREATE TABLE PERSONAGEM (
  ID_PERSONAGEM INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  PERSONAGEM VARCHAR(255) NOT NULL,
  CAF VARCHAR(255) NOT NULL UNIQUE, #CAF (COMPROVANTE DE ANIMAL FISICO)
  DATA_NASCIMENTO DATE NOT NULL,
  ID_AFILIACAO INT UNSIGNED NOT NULL,
  ID_ESPECIE INT  UNSIGNED NOT NULL,
  ID_TITULO INT  UNSIGNED  NOT NULL,
  ID_MAGIA INT  UNSIGNED  NOT NULL,
  ID_REGIAO INT  UNSIGNED  NOT NULL,
  ID_PERFIL INT  UNSIGNED  NOT NULL,
  FOREIGN KEY (ID_PERFIL) REFERENCES PERFIL(ID_PERFIL),
  FOREIGN KEY (ID_ESPECIE) REFERENCES ESPECIE(ID_ESPECIE),
  FOREIGN KEY (ID_MAGIA) REFERENCES MAGIA(ID_MAGIA),
  FOREIGN KEY (ID_TITULO) REFERENCES TITULO(ID_TITULO), 
  FOREIGN KEY (ID_REGIAO) REFERENCES REGIAO(ID_REGIAO),
  FOREIGN KEY (ID_AFILIACAO) REFERENCES AFILIACAO(ID_AFILIACAO)
);

#TABELA COM AS SALAS DOS EVENTOS
CREATE TABLE SALA (
  ID_SALA INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  SALA VARCHAR(255) NOT NULL,
  CAPACIDADE INT NOT NULL
);

#TABELA ITENS
CREATE TABLE ITEM (
	ID_ITEM INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	ITEM VARCHAR(255) NOT NULL,
	ID_SALA INT UNSIGNED NOT NULL,
	CONSTRAINT ID_SALA_ITENS_FK FOREIGN KEY (ID_SALA) REFERENCES SALA(ID_SALA)
);

#TABELA  TESTEMUNHAS
CREATE TABLE DEPOIMENTO (
  ID_DEPOIMENTO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_PERSONAGEM INT UNSIGNED NOT NULL,
  DEPOIMENTO TEXT NOT NULL,
  CONSTRAINT ID_PERSONAGEM_TESTEMUNHAS_FK FOREIGN KEY (ID_PERSONAGEM) REFERENCES PERSONAGEM(ID_PERSONAGEM)
);

#TABELA DE SOLUÇÃO PARA VALIDAR O SUSPEITO
CREATE TABLE SOLUCAO (
  ID_SOLUCAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_CULPADO INT UNSIGNED NOT NULL UNIQUE,
  FOREIGN KEY (ID_CULPADO) REFERENCES PERSONAGEM(ID_PERSONAGEM)
);

#SEGREDO PARA AUXILIAR NA SOLUÇÃO
CREATE TABLE COFRE(
  ID_COFRE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  SENHA INT NOT NULL,
  PISTA TEXT
);

#FICHAS CRIMINAIS DO REINO
CREATE TABLE FICHA_CRIMINAL(
  ID_CRIME INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_PERSONAGEM INT UNSIGNED NOT NULL,
  CRIME ENUM('ASSASSINATO','ROUBO','MAGIA DAS TREVAS','ALQUIMIA PROIBIDA','ESPIONAGEM','CORRUPIÇÃO','CONTRABANDO'),
  INICIO_PENA DATE NOT NULL,
  FIM_PENA DATE NOT NULL,
  STATUS ENUM('PRESO','LIVRE') NOT NULL,
  CONSTRAINT ID_PERSONAGEM_CRIME_FK FOREIGN KEY (ID_PERSONAGEM) REFERENCES PERSONAGEM(ID_PERSONAGEM)
);

#CARACTERISTICAS FISICAS DOS PERSONAGENS
CREATE TABLE MORFOLOGIA(
  ID_APARENCIA INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  ID_PERSONAGEM INT UNSIGNED NOT NULL UNIQUE,
  PELO VARCHAR(255),
  OLHOS VARCHAR(255) NOT NULL,
  ALTURA FLOAT NOT NULL,
  CONSTRAINT ID_PERSONAGEM_MORFOLOGIA_FK FOREIGN KEY (ID_PERSONAGEM) REFERENCES PERSONAGEM(ID_PERSONAGEM)
);

#DICAS DO PERSONAGEM SECUNDARIO 
CREATE TABLE DICA (
  ID_DICA INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  DICA TEXT NOT NULL
);

#TABELA DO EVENTO DO CASAMENTO 
CREATE TABLE EVENTO (
	ID_EVENTO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    EVENTO VARCHAR(255) NOT NULL
);

#PROGRAMAÇÕES DO EVENTO
CREATE TABLE PROGRAMACAO (
  ID_PROGRAMACAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  PROGRAMACAO VARCHAR(255) NOT NULL,
  ID_SALA INT UNSIGNED NOT NULL, 
  ID_EVENTO INT UNSIGNED NOT NULL,
  HORA_INICIO TIME NOT NULL,
  HORA_FINAL TIME NOT NULL,
  FOREIGN KEY (ID_SALA) REFERENCES SALA(ID_SALA),
  FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO)
);

CREATE TABLE CONVITE (
	ID_CONVITE INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_EVENTO INT UNSIGNED NOT NULL,
    ID_PERSONAGEM INT UNSIGNED NOT NULL,
    CONFIRMACAO BOOL,
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
    FOREIGN KEY (ID_PERSONAGEM) REFERENCES PERSONAGEM(ID_PERSONAGEM)
);

CREATE TABLE FUNCAO (
	ID_FUNCAO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FUNCAO VARCHAR(255)
);

CREATE TABLE CONTRATO (
	ID_CONTRATO INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    ID_EVENTO INT UNSIGNED NOT NULL,
    ID_PERSONAGEM INT UNSIGNED NOT NULL,
    ID_FUNCAO INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
    FOREIGN KEY (ID_PERSONAGEM) REFERENCES PERSONAGEM(ID_PERSONAGEM),
    FOREIGN KEY (ID_FUNCAO) REFERENCES FUNCAO(ID_FUNCAO)
);

# 3 VIEWS E 6 TABLES

CREATE VIEW DADOS_PESSOAIS  AS
	SELECT 
		ID_PERSONAGEM, PERSONAGEM, CAF, DATA_NASCIMENTO, TIPO_TITULO, ESPECIE, AFILIACAO, PELO, OLHOS, ALTURA, REGIAO, TIPO_MAGIA	
	FROM PERSONAGEM P
	INNER JOIN  TITULO T ON P.ID_TITULO = T.ID_TITULO
	INNER JOIN  ESPECIE E ON P.ID_ESPECIE = E.ID_ESPECIE
	INNER JOIN  AFILIACAO A ON P.ID_AFILIACAO = A.ID_AFILIACAO
	INNER JOIN  MORFOLOGIA M ON M.ID_PERSONAGEM = P.ID_PERSONAGEM
	INNER JOIN  REGIAO R ON P.ID_REGIAO = R.ID_REGIAO
	INNER JOIN  MAGIA MA ON P.ID_MAGIA = MA.ID_MAGIA
	


CREATE VIEW FICHA_CRIMINAL AS
	SELECT
		ID_CRIME, ID_PERSONAGEM, CRIME, DEPOIMENTO
	FROM DEPOIMENTO D
	INNER JOIN PERSONAGEM P ON P.ID_PERSONAGEM = D.ID_PERSONAGEM
	INNER JOIN FICHA_CRIMINAL F ON F.ID_PERSONAGEM = P.ID_PERSONAGEM
	

CREATE VIEW PRESENCA AS
	SELECT 
		ID_EVENTO, ID_PERSONAGEM, EVENTO, PERFIL, CONFIRMACAO, FUNCAO
	FROM PERSONAGEM P
	INNER JOIN  PERFIL PE ON PE.ID_PERFIL = P.ID_PERFIL
	INNER JOIN  CONTRATO C ON C.ID_PERSONAGEM = P.ID_PERSONAGEM
	INNER JOIN  FUNCAO F ON F.ID_FUNCAO = C.ID_FUNCAO
	INNER JOIN  EVENTO EV ON EV.ID_EVENTO = C.ID_EVENTO
	INNER JOIN  CONVITE CO ON EV.ID_EVENTO = CO.ID_EVENTO		
		 


USE SQL_MYSTERY;

DELIMITER $

#SÓ PODE ADICINAR NA CONVITE OS PERSONAGENS CONVIDADOS DA PERFIL
CREATE TRIGGER TG_CONVITE_PERSONAGEM
BEFORE INSERT
ON CONVITE
FOR EACH ROW
BEGIN
	DECLARE vPerfil TEXT;
    SET vPerfil = (
		SELECT
			PL.NOME
		FROM
			PERSONAGEM PM
		INNER JOIN
			PERFIL PL
		ON
			PL.ID_PERFIL = PM.ID_PERFIL
		WHERE
			PM.ID_PERSONAGEM = NEW.ID_PERSONAGEM
    );
    
    IF UPPER(vPerfil) != 'CONVIDADO' THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'ESSE PERSONAGEM É FUNCIONÁRIO';     
   END IF;
END;

#SÓ PODE ADICINAR NA CONTRATO OS PERSONAGENS FUNCIONÁRIOS DA PERFIL
CREATE TRIGGER TG_CONTRATO_PERSONAGEM
BEFORE INSERT
ON CONTRATO
FOR EACH ROW
BEGIN
	DECLARE vPerfil TEXT;
    SET vPerfil = (
		SELECT
			PL.NOME
		FROM
			PERSONAGEM PM
		INNER JOIN
			PERFIL PL
		ON
			PL.ID_PERFIL = PM.ID_PERFIL
		WHERE
			PM.ID_PERSONAGEM = NEW.ID_PERSONAGEM
    );
    
    IF UPPER(vPerfil) != 'FUNCIONÁRIO' THEN
		SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'ESSE PERSONAGEM É CONVIDADO';     
   END IF;
END;

$ DELIMITER ;
