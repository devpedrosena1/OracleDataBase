-- O exercício pede para usar a tabela de 'employess', mas nessa base de dados
-- não temos essa tabela

-- employess -> cliente
-- departaments -> estoque
-- job_history -> historico de pedido
-- locations -> cidade
-- jobs -> pedido
-- regiao -> estado

-- 1. Selecione todas as linhas e colunas da tabela "employees".
SELECT * FROM cliente;

-- 2. Selecione todas as linhas da tabela "departments".
SELECT * FROM estoque;

-- 3. Selecione as colunas "employee_id", "first_name" e "last_name" da tabela "employees".
SELECT * FROM cliente;

-- COD_CLIENTE, NOME_CLIENTE, NUM CPF
SELECT 
    cod_cliente "Código do cliente",
    nom_cliente "Nome do Cliente",
    num_cpf_cnpj "CPF ou CNPJ"
FROM 
    cliente;
    
-- 4. Selecione todas as linhas da tabela "job_history" onde o "start_date" é posterior a 01/01/2022.
SELECT * FROM historico_pedido;

-- COD_PEDIDO, DAT_PEDIDO, VAL_TOTAL_PEDIDO
SELECT 
    cod_pedido "Códidgo do Pedido",
    dat_pedido "Data do Pedido",
    val_total_pedido "Valor do Pedido"
FROM 
    historico_pedido
WHERE 
    dat_pedido >= '03/05/2024'
ORDER BY 
    val_total_pedido ASC;
    
-- E se eu quisesse saber a soma de todos esses valores?
-- Podemos usar a função SUM()
SELECT 
    SUM(val_total_pedido)
FROM
    historico_pedido
ORDER BY
    val_total_pedido ASC;
    
-- 5. Selecione todas as linhas da tabela "employees" onde o salário é maior que 5000.
SELECT * FROM cliente;

-- STA_ATIVO
SELECT 
    sta_ativo "Ativo"
FROM 
    cliente
WHERE 
    sta_ativo = 'S';
    
-- 6. Selecione todas as linhas da tabela "countries" onde o país começa com a letra 'U'
SELECT * FROM pais;

-- COD_PAIS, NOM_PAIS
SELECT 
    cod_pais "Código do Páis",
    nom_pais "Nome do País"
FROM 
    pais
WHERE 
    nom_pais LIKE 'B%' OR nom_pais LIKE 'E%';
    
-- 7. Selecione todas as linhas da tabela "locations" onde a cidade é 'New York'.
SELECT * FROM cidade;

-- COD_CIDADE, NOM_CIDADE
SELECT 
    cod_cidade "Código da Cidade",
    nom_cidade "Nome da cidade"
FROM 
    cidade
WHERE
    nom_cidade = 'Curitiba'
GROUP BY
    cod_cidade, nom_cidade
ORDER BY
    2 ASC;
    