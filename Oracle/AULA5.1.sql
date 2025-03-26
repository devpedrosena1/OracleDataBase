SELECT * FROM TB_CLIENTES;
SELECT * FROM TB_PRODUTOS;

SELECT
    produto AS "CODIGO DO PRODUTO",
    nome    AS "NOME DO PRODUTO",
    embalagem,
    tamanho,
    sabor,
    preco_lista
FROM
    tb_produtos;