# O Enigma SQL🕵️‍♀️🔍


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

## Como Rodar o Projeto

1. **Banco de dados**: Baixe e instale o SGBD `MySQL` no computador seguindo o link abaixo

    ```
    https://dev.mysql.com/downloads/installer/
    ```
    

    - Ao finalizar a instalação, certifique que as configurações do SGBD sejam assim: Server=localhost, Database=sql_mystery, Uid=root; Pwd=1234;
    - Após finalizar a configuração, monte o banco de dados rodando o script `SQL-MYSTERY-DDL` para montar o banco de dados;
    - Em seguida rode o `SQL-MYSTERY-DML` para inserir os dados no banco de dados.
   
2. **Framework.NET**: Utilize o `Visual Studio` para baixar as extensões necessarias

    ```
    https://visualstudio.microsoft.com/pt-br/downloads/
    ```

3. **Clone o repositório**: Para clonar o repositório, você precisa ter o `git` instalado em seu computador. Abra o terminal e execute o seguinte comando


    ```
    git clone https://github.com/duducaa/SQL-MYSTERY.git
    ```
    
4. **Conecte o banco de dados**: Conecte o MySQL com no Visual Studio. Para isso, siga os passos abaixo
    - Rode o projeto no `Visual Studio`, ele irá conectar automaticamente se as configurações do SGBD estiverem corretas.


5. **Rodar o Front-end**: Rodar o front end para começar a jogar.
   - Vá até a pasta `FRONT-END` loocalizada no repositório e clicke duas vezes no arquivo `index` para rodar o projeto. 

Nosso objetivo com este projeto é tornar o aprendizado divertido e emocionante. Esperamos que você goste de jogar este jogo tanto quanto gostamos de criá-lo! 🎉🎈


## Observação:bangbang:
O projeto ainda está em desenvolvimento, ou seja, o roteiro de investigação ainda está incompleto. Mas no momento já é possivel validar as Query do projeto.
