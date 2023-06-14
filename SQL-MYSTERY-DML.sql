#INSERT DOS TIPOS DE PERFIS DA FESTA
INSERT INTO TB_PERFIL VALUES 
	(1, 'CONVIDADO'),
	(2, 'FUNCIONÁRIO'),
	(3, 'DETETIVE');
  
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
    
INSERT INTO TB_REGIAO VALUES
	(1, 'Norte'),
    (2, 'Sul'),
    (3, 'Leste'),
    (4, 'Oeste'),
    (5, 'Centro');

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

#INSERT DO CASAMENTO NA TABELA CASAMENTO
INSERT INTO TB_EVENTO VALUES
	(1, 'CASAMENTO');

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

INSERT INTO TB_FUNCAO VALUES
	(1, 'Mordomo'),
	(2, 'Cerimonialista'),
	(3, 'Segurança'),
	(4, 'Florista'),
	(5, 'Estilista'),
	(6, 'Músico'),
	(7, 'Fotógrafo'),
	(8, 'Videógrafo'),
	(9, 'Chefe de Cozinha'),
	(10, 'Garçom'),
	(11, 'Motorista'),
	(12, 'Coordenador de Eventos'),
	(13, 'Maître'),
	(14, 'Bartender'),
	(15, 'Camareiro'),
	(16, 'Copeiro'),
	(17, 'Padeiro'),
	(18, 'Chef de Confeitaria'),
	(19, 'Recepcionista'),
	(20, 'Limpeza');



----------------------------------------------------------------------------------------------------------------------------------------------
-- TB_PERSONAGEM
INSERT INTO TB_PERSONAGEM (NOME_PERSONAGEM, CAF, DATA_NASCIMENTO, ID_AFILIACAO, ID_ESPECIE, ID_TITULO, ID_MAGIA, ID_REGIAO, ID_PERFIL) VALUES
('Leão', 'CAF001', '2000-01-01', 1, 1, 1, 1, 1, 1),
('Tigre', 'CAF002', '2001-02-02', 2, 2, 2, 2, 2, 2),
('Urso', 'CAF003', '2002-03-03', 3, 3, 3, 3, 3, 3);

-- TB_AFILIACAO
INSERT INTO TB_AFILIACAO (AFILIACAO) VALUES
('Ordem dos Magos'),
('Clã dos Ninjas'),
('Guilda dos Alquimistas'),
('Sociedade dos Ilusionistas'),
('Fraternidade dos Feiticeiros'),
('Conselho dos Druidas');

-- TB_DEPOIMENTO
INSERT INTO TB_DEPOIMENTO (ID_PERSONAGEM, DEPOIMENTO) VALUES
(1, 'Eu vi o Leão perto do local do crime.'),
(2, 'O Tigre parecia nervoso durante o casamento.'),
(3, 'O Urso estava discutindo com a vítima antes do crime.');

-- TB_SOLUCAO
INSERT INTO TB_SOLUCAO (ID_CULPADO) VALUES
(2); -- Suponha que o Tigre seja o culpado

-- TB_COFRE
INSERT INTO TB_COFRE (SENHA, PISTA) VALUES
(1234, 'O culpado tem uma afiliação com ninjas.');

-- TB_FICHA_CRIMINAL
INSERT INTO TB_FICHA_CRIMINAL (ID_PERSONAGEM, CRIME, INICIO_PENA, FIM_PENA, STATUS) VALUES
(1, 'ASSASSINATO', '2010-01-01', '2020-01-01', 'LIVRE'),
(2, 'ROUBO', '2011-02-02', '2021-02-02', 'LIVRE'),
(3, 'MAGIA DAS TREVAS', '2012-03-03', '2022-03-03', 'LIVRE');

-- TB_MORFOLOGIA
INSERT INTO TB_MORFOLOGIA (ID_PERSONAGEM, PELO, OLHOS, ALTURA) VALUES
(1, 'Dourado', 'Verde', 1.2),
(2, 'Listrado', 'Azul', 1.5),
(3, 'Marrom', 'Preto', 2.0);

-- TB_DICA
INSERT INTO TB_DICA (DICA) VALUES
('O culpado estava nervoso durante o casamento.'),
('O culpado tem uma ficha criminal.'),
('O culpado tem uma afiliação com ninjas.');

-- TB_CONVITE
INSERT INTO TB_CONVITE (ID_EVENTO, ID_PERSONAGEM, CONFIRMACAO) VALUES
(1, 1, TRUE),
(1, 2, TRUE),
(1, 3, TRUE);

-- TB_CONTRATO
```sql
INSERT INTO TB_CONTRATO (ID_EVENTO, ID_PERSONAGEM, ID_FUNCAO) VALUES
(1, 1, 1), -- Suponha que o Leão seja o segurança
(1, 2, 2), -- Suponha que o Tigre seja o cozinheiro
(1, 3, 3); -- Suponha que o Urso seja o músico