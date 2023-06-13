function setup() {
    const url = "http://localhost:5227/api/Request";

    fetch(url, {
        method: "POST",
        body: JSON.stringify("SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_NAME LIKE 'tb_%'"),
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
        dynamicTable(document.querySelector(".data-table"), JSON.parse(json))
    })
}

function handleError() {
    
}


function dynamicTable(container, dados) {
    // Cria a tabela
    const tabela = document.createElement('table');
    tabela.classList.add('tabela-dinamica');

    // Cria a linha de cabeçalho
    const cabecalho = document.createElement('tr');
    for (const chave in dados[0]) {
        const th = document.createElement('th');
        th.classList.add("list-head");
        th.textContent = chave.toUpperCase();
        cabecalho.appendChild(th);
    }
    tabela.appendChild(cabecalho);

    // Cria as linhas de dados
    dados.forEach((item) => {
        const linha = document.createElement('tr');
        for (const chave in item) {
            const celula = document.createElement('td');
            celula.textContent = item[chave];
            linha.appendChild(celula);
        }
        tabela.appendChild(linha);
    });

    // Adiciona a tabela ao container
    container.appendChild(tabela);

    return tabela;
}
