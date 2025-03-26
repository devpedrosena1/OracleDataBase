-- Select com WHERE e Order BY
SELECT 
    cod_cliente "Código do Cliente",
    des_endereco "Endereco Cliente",
    num_endereco "Número",
    des_bairro "Bairro"
FROM 
    pf1788.endereco_cliente
where cod_cliente = 19
ORDER BY 
    1,
    2;  

--

-- Para deixar TUDO maiusculo usamos o UPPER()
SELECT 
    cod_cliente "Código Cliente",
    sta_ativo "Ativo",
    UPPER(nom_cliente) "Nome Cliente",
    dat_cadastro "Data de Cadastro"
FROM 
    pf1788.CLIENTE
WHERE
    cod_cliente = 37
ORDER BY 
    nom_cliente DESC, dat_cadastro ASC;
    

-- Para deixar TUDO minusculo usamos o LOWER()
-- Para saber o mínimo de uma linha, ex -> o min de uma data: min()
SELECT 
    MIN(dat_cadastro) "Data de Cadastro"
FROM 
    pf1788.CLIENTE;

-- para o ultimo registo max()
SELECT 
    MAX(dat_cadastro) "Data de Cadastro"
FROM 
    pf1788.CLIENTE;

-- Contar quantas linhas tem a minha tabela - COUNT(1) ou COUNT(*)
SELECT COUNT(1), dat_cadastro FROM pf1788.CLIENTE
GROUP BY 
    dat_cadastro
ORDER BY
    2;
    

BEGIN
    FOR x IN (
        SELECT
            table_name
        FROM
            user_tables
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE '
                          || x.table_name
                          || ' CASCADE CONSTRAINT';
    END LOOP;
END;