SELECT
    *
FROM
    pais ORDER BY 1;
    
UPDATE pais
SET
    nome_pais = 'BRASIL'
WHERE
    id_pais = 101;
    commit;
    SELECT * FROM PAIS ORDER BY 1;
    
DELETE FROM pais
WHERE
    id_pais = 941;
    
DELETE FROM pais
WHERE
    id_pais = 942;
    
DELETE FROM pais
WHERE
    id_pais = 943;
    
DELETE FROM pais
WHERE
    id_pais = 944;
    
DELETE FROM pais
WHERE
    id_pais = 945;
    
COMMIT;
    
SELECT * FROM PAIS;

-- ESTADO
DELETE FROM estado
WHERE
    id_estado = 946;

DELETE FROM estado
WHERE
    id_estado = 947;

DELETE FROM estado
WHERE
    id_estado = 948;

DELETE FROM estado
WHERE
    id_estado = 949;

DELETE FROM estado
WHERE
    id_estado = 950;
    
DELETE FROM estado
WHERE
    id_estado = 951;

DELETE FROM estado
WHERE
    id_estado = 952;

DELETE FROM estado
WHERE
    id_estado = 953;

DELETE FROM estado
WHERE
    id_estado = 954;

DELETE FROM estado
WHERE
    id_estado = 955;

DELETE FROM estado
WHERE
    id_estado = 956;

DELETE FROM estado
WHERE
    id_estado = 957;

DELETE FROM estado
WHERE
    id_estado = 958;

DELETE FROM estado
WHERE
    id_estado = 959;

DELETE FROM estado
WHERE
    id_estado = 960;

DELETE FROM estado
WHERE
    id_estado = 961;

DELETE FROM estado
WHERE
    id_estado = 962;

DELETE FROM estado
WHERE
    id_estado = 963;

DELETE FROM estado
WHERE
    id_estado = 964;

DELETE FROM estado
WHERE
    id_estado = 965;

DELETE FROM estado
WHERE
    id_estado = 966;

DELETE FROM estado
WHERE
    id_estado = 967;

DELETE FROM estado
WHERE
    id_estado = 968;

DELETE FROM estado
WHERE
    id_estado = 969;

DELETE From estado where id_estado = 970;

COMMIT;

SELECT * FROM ESTADO;

-- Cidade
SELECT
    *
FROM
    cidade;

DELETE FROM cidade
WHERE
    id_cidade BETWEEN 971 AND 1095;
    
-- Bairro
SELECT * FROM BAIRRO;