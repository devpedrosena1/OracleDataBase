-- Qual o produto teve mais saidas?
SELECT
    cod_produto,
    SUM(qtd_movimentacao_estoque)
FROM
    movimento_estoque
    WHERE COD_PRODUTO = 3
GROUP BY
    cod_produto
ORDER BY
    2 DESC;
    
-- Qual foi o cliente que mais comprou
SELECT * FROM historico_pedido;

SELECT
    cod_cliente,
    count(1)
FROM 
    historico_pedido
GROUP BY
    cod_cliente
ORDER BY
    2 DESC
    
