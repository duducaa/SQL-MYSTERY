function setup() {
    const url = "http://localhost:5227/api/Request";

    fetch(url, {
        method: "POST",
        body: JSON.stringify("SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_NAME LIKE '%'"),
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
    })
    .then((response) => response.json())
    .then((json) => {
        console.log(json)
        dynamicTable(document.querySelector(".list-table"), JSON.parse(json))
    })
}

function query() {
    let input = document.querySelector(".query").value;

    let url = "";

    if(input.toUpperCase().startsWith("INSERT")) {
        url = "http://localhost:5227/api/Request/InsertQuery";
    }
    else {
        url = "http://localhost:5227/api/Request";
    }

    fetch(url, {
        method: "POST",
        body: JSON.stringify(input),
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
    })
    .then((response) => response.json())
    .then((json) => {
        console.log(json)
        document.querySelector(".data-table").innerHTML = ""
        document.querySelector(".error").innerHTML = ""
        if(handleResponse(json, input)) {
            dynamicTable(document.querySelector(".data-table"), JSON.parse(json));
        }
    })
    .catch((ev) => {
        document.querySelector(".error").innerHTML = ev;
    })
}

function handleResponse(json, input) {
    if(json.includes(`"Code":"1064"`)) {
        document.querySelector(".error").innerHTML = JSON.parse(json)["Message"];
        return false;
    }

    if(json.includes(`"Code":"1062"`) && input.includes("solucao")) {
        alert("Você Encontrou o Culpado, Prabéns!");
        return false;
    }
    else if(json.includes(`"Code":"1062"`)) {
        document.querySelector(".error").innerHTML = JSON.parse(json)["Message"];
        return false;
    }

    if(json.includes(`"code:"`)) {
        document.querySelector(".error").innerHTML = JSON.parse(json)["Message"]
        return false;
    }

    if(input.toUpperCase().includes("SELECT")) {
        return true;
    }

    return false;
}


function dynamicTable(container, dados) {
    const tabela = document.createElement('table');
    tabela.classList.add('tabela-dinamica');

    const cabecalho = document.createElement('tr');
    for (const chave in dados[0]) {
        const th = document.createElement('th');
        th.classList.add("list-head");
        th.textContent = chave.toUpperCase();
        cabecalho.appendChild(th);
    }
    tabela.appendChild(cabecalho);

    dados.forEach((item) => {
        const linha = document.createElement('tr');
        for (const chave in item) {
            const celula = document.createElement('td');
            celula.textContent = item[chave];
            linha.appendChild(celula);
        }
        tabela.appendChild(linha);
    });

    container.appendChild(tabela);

    return tabela;
}

// Adiciona comentários do projeto
document.querySelector("#show_comments_button").addEventListener("click", function() {
    const commentsDiv = document.querySelector("#project_comments");
    if (commentsDiv.style.display === "none") {
        commentsDiv.style.display = "block";
        commentsDiv.innerHTML = `
            <h2>Descrição do Projeto</h2>
            <p>Este projeto é como um jogo de detetive, mas em vez de procurar pistas em um tabuleiro, você está procurando pistas em um banco de dados! O jogo se chama "Aventura na Floresta Encantada", e é um mistério de assassinato que você precisa resolver. Para ganhar, você precisa descobrir quem é o culpado e provar isso com o ID único do suspeito.</p>
            
            <h2>Objetivo</h2>
            <p>O objetivo final é como um jogo de adivinhação. Você precisa descobrir quem é o culpado e provar isso com o ID único do suspeito. É como um jogo de detetive, mas em vez de procurar pistas em um tabuleiro, você está procurando pistas em um banco de dados!</p>
            
            <h2>Comandos SQL Básicos</h2>
            <h3>SELECT</h3>
            <p>Este comando é usado para selecionar dados de um banco de dados. Os dados retornados são armazenados em uma tabela de resultados.</p>
            <code>SELECT column1, column2 FROM table_name;</code>
            
            <h3>UPDATE</h3>
            <p>O comando UPDATE é usado para alterar os dados existentes em uma tabela.</p>
            <code>UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;</code>
            
            <h3>DELETE</h3>
            <p>O comando DELETE é usado para deletar registros existentes em uma tabela.</p>
            <code>DELETE FROM table_name WHERE condition;</code>
            
            <h3>INSERT</h3>
            <p>O comando INSERT INTO é usado para inserir novos registros em uma tabela.</p>
            <code>INSERT INTO table_name (column1, column2) VALUES (value1, value2);</code>
            
            <h3>JOIN</h3>
            <p>O comando JOIN é usado para combinar linhas de duas ou mais tabelas, com base em uma coluna relacionada entre elas.</p>
            <code>SELECT column_name(s) FROM table1 JOIN table2 ON table1.column_name = table2.column_name;</code>
            
            <h3>WHERE</h3>
            <p>O comando WHERE é usado para filtrar registros.</p>
            <code>SELECT column1, column2 FROM table_name WHERE condition;</code>
        `;
    } else {
        commentsDiv.style.display = "none";
    }
});
