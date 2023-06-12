# O Enigma SQL para Crianças 🕵️‍♀️🔍

## 📝 Descrição

Este projeto é como um jogo de detetive, mas em vez de procurar pistas em um tabuleiro, você está procurando pistas em um banco de dados! O jogo se chama "Aventura na Floresta Encantada", e é um mistério de assassinato que você precisa resolver. Para ganhar, você precisa descobrir quem é o culpado e provar isso com o ID único do suspeito.

## 🎯 Objetivo

O objetivo final é como um jogo de adivinhação. Você precisa descobrir quem é o culpado e provar isso com o ID único do suspeito. É como um jogo de detetive, mas em vez de procurar pistas em um tabuleiro, você está procurando pistas em um banco de dados!

## 💻 Tecnologias

Nós usamos algumas ferramentas diferentes para criar este jogo. Usamos MySQL para o banco de dados, que é onde todas as informações do jogo são armazenadas. Usamos C# para o back-end, que é a parte do jogo que você não vê, mas que faz tudo funcionar. E usamos HTML/CSS para o front-end, que é a parte do jogo que você vê e com a qual interage.

## 🕹️ Como o Jogo Funciona

O jogo é organizado em quatro partes diferentes que trabalham juntas:

1. **Apresentação**: Esta é a parte do jogo que você vê. É onde você insere suas perguntas e vê as respostas.

2. **Serviço**: Esta é a parte do jogo que pega as perguntas que você fez e as prepara para serem enviadas ao banco de dados.

3. **DAL (Data Access Layer)**: Esta é a parte do jogo que realmente envia suas perguntas para o banco de dados.

4. **Banco de Dados**: Esta é a parte do jogo que contém todas as informações. Quando recebe suas perguntas, procura as respostas e as envia de volta para você.

Quando você faz uma pergunta, ela passa por todas essas partes na seguinte ordem: Apresentação -> Serviço -> DAL -> Banco de dados. Depois que o banco de dados encontra a resposta, ele a envia de volta para você na ordem inversa: Banco de dados -> DAL -> Serviço -> Apresentação.

Nosso objetivo com este projeto é tornar o aprendizado divertido e emocionante. Esperamos que você goste de jogar este jogo tanto quanto gostamos de criá-lo! 🎉🎈
