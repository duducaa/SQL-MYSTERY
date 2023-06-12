# O Enigma SQL

## Descrição

Este projeto é dedicado a proporcionar uma experiência interativa e educacional através do desenvolvimento de um website voltado ao aprendizado da linguagem DQL do SQL. Ele é centrado em um jogo de investigação cativante intitulado "Aventura na Floresta Encantada", onde os jogadores se envolvem em um enigma de assassinato e precisam identificar o culpado para vencer.

## Objetivo

O objetivo final é identificar o culpado e confirmar a acusação através da inserção do ID único do suspeito.

## Tecnologias

Optamos por implementar o projeto usando as seguintes tecnologias:

- Banco de dados: `MySQL`
- Back-end: `C#`
- Front-end: `HTML/CSS`

## Estrutura do Projeto

O projeto é organizado em quatro camadas interdependentes:

1. `Apresentação`
2. `Serviço`
3. `DAL (Data Access Layer)`
4. `Banco de Dados`

A sequência que as consultas do jogador percorrem o sistema é a seguinte:

- Entrada: `Apresentação` -> `Serviço` -> `DAL` -> `Banco de dados`
- Saída: `Banco de dados` -> `DAL` -> `Serviço` -> `Apresentação`

Depois que as entradas viajam através dessas camadas até o banco de dados, o banco de dados processa as informações e executa os triggers necessários. O resultado final é então enviado de volta para a camada de apresentação, exibindo a tabela resultante ou mensagem de erro ao jogador.

Nosso objetivo com este projeto é proporcionar uma jornada educacional divertida.
