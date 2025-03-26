-- create
CREATE TABLE TB_CLIENTES
(
    CPF VARCHAR2(11),
    NOME VARCHAR2(100),
    ENDERECO1 VARCHAR2(150),
    ENDERECO2 VARCHAR2(150),
    BAIRRO VARCHAR2(50),
    CIDADE VARCHAR2(50),
    ESTADO VARCHAR2(2),
    CEP VARCHAR2(8),
    DATA_NASCIMENTO DATE,
    IDADE INTEGER,
    SEXO VARCHAR2(1),
    LIMITE_CREDITO NUMBER(15,2),
    VOLUME_COMPRA NUMBER,
    PRIMEIRA_COMPRA NUMBER(1)
)

CREATE TABLE TB_PRODUTOS (
    PRODUTO VARCHAR2(11),
    NOME VARCHAR(255) NOT NULL,
    EMBALAGEM VARCHAR(100),
    TAMANHO VARCHAR(50),
    SABOR VARCHAR(100),
    PRECO_LISTA DECIMAL(10,2) NOT NULL
);

CREATE TABLE TB_VENDEDORES (
     MATRICULA varchar(5),
     NOME varchar(100),
     DATA_ADMISSAO date,
     PERCENTUAL_COMISSAO number
);

-- insert

INSERT INTO tb_produtos (
    produto,
    nome,
    embalagem,
    tamanho,
    sabor,
    preco_lista
) VALUES ( '1040107',
           'Light - 350 ml - Melãncia',
           'Lata',
           '350 ml',
           'Melancia',
           4.56 );

INSERT INTO TB_VENDEDORES (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00233',
           'Joao Geraldo da Fonseca',
           '01/12/2015',
           0.10 );
           
INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00400',
           'Maria do Rosario',
           '23/07/2012',
           0.15 );

INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00810',
           'Marcia Almeida',
           '14/12/2016',
           0.18 );

INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00414',
           'Carlos Moreira',
           '13/11/2015',
           0.14 );

INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00934',
           'Juvenildo Martins',
           '09/03/2010',
           0.20 );
           
INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00265',
           'Jonh Wayne',
           TO_DATE('03/27/2019', 'MM/DD/YYYY'),
           0.12 );

INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00777',
           'Katy Peterson',
           TO_DATE('02/04/2020', 'MM/DD/YYYY'),
           0.10 );

INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00342',
           'Rodrigo Almeida',
           '18/01/2022',
           0.09 );

INSERT INTO tb_vendedores (
    matricula,
    nome,
    data_admissao,
    percentual_comissao
) VALUES ( '00729',
           'Patricia Martins',
           '02/01/2022',
           0.09 );
           
-- UPDATE
SELECT * FROM TB_PRODUTOS;

UPDATE tb_produtos
SET
    embalagem = 'Pet'
WHERE
    produto = '1040107';
    
UPDATE tb_produtos
SET
    nome = 'Light - 2 LITROS - Melãncia',
    tamanho = '2L',     
    preco_lista = 16.00
WHERE
    produto = '1040107';
    
SELECT * FROM TB_VENDEDORES;

UPDATE tb_vendedores
SET
    percentual_comissao = 0.18
WHERE
    matricula = '00233';

UPDATE tb_vendedores
SET
    percentual_comissao = 0.18
WHERE
    matricula = '00400';

UPDATE tb_vendedores
SET
    percentual_comissao = 0.18
WHERE
    matricula = '00414';
    
-- delete
SELECT * FROM TB_PRODUTOS;

DELETE FROM TB_PRODUTOS WHERE PRODUTO = '1040107';

SELECT * FROM TB_VENDEDORES;

DELETE FROM TB_VENDEDORES WHERE MATRICULA = '00400';

-- ALTER
ALTER TABLE tb_produtos ADD CONSTRAINT pk_tb_produtos PRIMARY KEY ( produto );

SELECT * FROM TB_VENDEDORES;

ALTER TABLE TB_VENDEDORES ADD CONSTRAINT PK_TB_VENDEDORES PRIMARY KEY (MATRICULA);

ALTER TABLE TB_CLIENTES ADD CONSTRAINT PK_TB_CLIENTES PRIMARY KEY (CPF);

INSERT INTO TB_CLIENTES (
    CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP, 
    DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA
) VALUES (
    '00333434577', 'João Silva', 'Rua das Flores, 123', NULL, 'Centro', 
    'São Paulo', 'SP', '01001000', '10/12/1995', 
    34, 'M', 100000, 2000, 0
);

SELECT * FROM TB_CLIENTES;

SELECT TO_CHAR(DATA_NASCIMENTO, 'MM') FROM TB_CLIENTES;

DELETE FROM TB_CLIENTES WHERE CPF = '00333434577';

INSERT INTO TB_CLIENTES (
    CPF, NOME, ENDERECO1, ENDERECO2, BAIRRO, CIDADE, ESTADO, CEP, 
    DATA_NASCIMENTO, IDADE, SEXO, LIMITE_CREDITO, VOLUME_COMPRA, PRIMEIRA_COMPRA
) VALUES (
    '00333434577', 'João Silva', 'Rua das Flores, 123', NULL, 'Centro', 
    'São Paulo', 'SP', '01001000', TO_DATE('10/12/1995', 'DD/MM/YYYY'), 
    34, 'M', 100000, 2000, 0
);
