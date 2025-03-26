CREATE TABLE pais (
    id_pais   NUMBER PRIMARY KEY,
    nome_pais VARCHAR2(30) NOT NULL
);

CREATE TABLE estado (
    id_estado   NUMBER PRIMARY KEY,
    id_pais     NUMBER,
    nome_estado VARCHAR(30) NOT NULL
);

ALTER TABLE estado
    ADD CONSTRAINT fk_estado FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

CREATE TABLE cidade (
    id_cidade   NUMBER PRIMARY KEY,
    id_estado   NUMBER,
    nome_cidade VARCHAR(30) NOT NULL
);

ALTER TABLE cidade
    ADD CONSTRAINT fk_cidade FOREIGN KEY ( id_estado )
        REFERENCES estado ( id_estado );

CREATE TABLE bairro (
    id_bairro   NUMBER PRIMARY KEY,
    id_cidade   NUMBER,
    nome_bairro VARCHAR2(30) NOT NULL
);

ALTER TABLE bairro
    ADD CONSTRAINT fk_bairro FOREIGN KEY ( id_cidade )
        REFERENCES cidade ( id_cidade );

CREATE TABLE endereco_cliente (
    cod_endereco NUMBER PRIMARY KEY,
    id_bairro    NUMBER,
    cep          NUMBER,
    logradouro   VARCHAR(50) NOT NULL,
    numero       NUMBER,
    referencia   VARCHAR2(30),
    CONSTRAINT fk_endereco FOREIGN KEY ( id_bairro )
        REFERENCES bairro ( id_bairro )
);

CREATE TABLE cliente (
    id_cliente   NUMBER PRIMARY KEY,
    cpf          NUMBER,
    nome_cliente VARCHAR2(30) NOT NULL,
    genero       VARCHAR2(10)
);

CREATE TABLE genero (
    cod_genero NUMBER PRIMARY KEY,
    descricao  VARCHAR2(30) NOT NULL
);

CREATE TABLE cliente_fisico (
    cod_cliente_fisico  NUMBER PRIMARY KEY,
    cpf                 NUMBER,
    cliente_cod_cliente NUMBER,
    cod_genero          NUMBER,
    CONSTRAINT fk_genero_fisico FOREIGN KEY ( cliente_cod_cliente )
        REFERENCES cliente ( id_cliente ),
    CONSTRAINT fk_genero_cliente FOREIGN KEY ( cod_genero )
        REFERENCES genero ( cod_genero )
);

CREATE TABLE cliente_juridico (
    cod_pessoa_ju       NUMBER PRIMARY KEY,
    cpnj                NUMBER,
    ie                  NUMBER,
    cliente_cod_cliente NUMBER,
    CONSTRAINT fk_cliente_juridico FOREIGN KEY ( cliente_cod_cliente )
        REFERENCES cliente ( id_cliente )
);

CREATE TABLE pedido (
    cod_pedido                 NUMBER PRIMARY KEY,
    data_pedido                DATE,
    cliente_fisico_cod_cliente NUMBER,
    cliente_fisico_cod_genero  NUMBER,
    cod_funcionario            NUMBER,
    cod_pessoa_ju              NUMBER,
    CONSTRAINT fk_pedido_cliente_fisico FOREIGN KEY ( cliente_fisico_cod_cliente )
        REFERENCES cliente ( id_cliente ),
    CONSTRAINT fk_pedido_funcionario FOREIGN KEY ( cod_funcionario )
        REFERENCES funcionario ( cod_funcionario ),
    CONSTRAINT fk_pedido_cliente_juridico FOREIGN KEY ( cod_pessoa_ju )
        REFERENCES cliente_juridico ( cod_pessoa_ju )
);

CREATE TABLE funcionario (
    cod_funcionario NUMBER PRIMARY KEY,
    nome            VARCHAR2(30) NOT NULL,
    data_cadastro   DATE,
    cargo_cod_cargo NUMBER,
    cod_gestor      NUMBER,
    CONSTRAINT fk_funcionario_cargo FOREIGN KEY ( cargo_cod_cargo )
        REFERENCES cargo ( cod_cargo )
);

CREATE TABLE cargo (
    cod_cargo NUMBER PRIMARY KEY,
    nome      VARCHAR2(30) NOT NULL
);

CREATE TABLE item_pedido (
    quantidade     NUMBER(10),
    valor_unitario NUMBER(10),
    valor_total    NUMBER(10),
    cod_pedido     NUMBER,
    cod_produto    NUMBER,
    PRIMARY KEY ( cod_pedido,
                  cod_produto ),
    CONSTRAINT fk_item_pedido_pedido FOREIGN KEY ( cod_pedido )
        REFERENCES pedido ( cod_pedido ),
    CONSTRAINT fk_item_pedido_produto FOREIGN KEY ( cod_produto )
        REFERENCES produto ( cod_produto )
);

CREATE TABLE produto (
    cod_produto NUMBER PRIMARY KEY,
    descricao   VARCHAR2(50),
    cod_tipo    NUMBER,
    CONSTRAINT fk_produto_tipo FOREIGN KEY ( cod_tipo )
        REFERENCES tipo ( cod_tipo )
);

CREATE TABLE tipo (
    cod_tipo  NUMBER PRIMARY KEY,
    descricao VARCHAR2(30) NOT NULL
);

 -- CRIANDO SEQUENCIA
CREATE SEQUENCE sq_aula_ddl;

-- PAIS
INSERT INTO pais (
    id_pais,
    nome_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BRASIL' );

COMMIT;

INSERT INTO pais (
    id_pais,
    nome_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ARGENTINA' );

COMMIT;

INSERT INTO pais (
    id_pais,
    nome_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALEMANHA' );

COMMIT;

INSERT INTO pais (
    id_pais,
    nome_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PORTUGAL' );

COMMIT;

INSERT INTO pais (
    id_pais,
    nome_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FRAN�A' );

COMMIT;

SELECT
    *
FROM
    pais;

-- ESTADO
-- BRASIL
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAO PAULO',
           101 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MINAS GERAIS',
           101 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BAHIA',
           101 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RIO DE JANEIRO',
           101 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RIO GRANDE DO SUL',
           101 );

COMMIT;

-- ARGENTINA
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BUENOS AIRES',
           102 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MENDONZA',
           102 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'C�RDOBA',
           102 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA FE',
           102 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CABA',
           102 );

COMMIT;

-- ALEMANHA
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIM',
           103 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAXONIA',
           103 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HAMBURGO',
           103 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BAYERN',
           103 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'TURINGIA',
           103 );

COMMIT;

-- PORTUGAL
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LISBOA',
           104 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PORTO',
           104 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FARO',
           104 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'COIMBRA',
           104 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MADEIRA',
           104 );

COMMIT;

-- FRAN�A
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BRETAGNE',
           105 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CORSE',
           105 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HAUTS-DE-FRANCE',
           105 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NORMANDIE',
           105 );

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ILE-DE-FRANCE',
           105 );

COMMIT;

SELECT
    *
FROM
    estado;

-- CIDADES

-- SAO PAULO
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'S�O PAULO',
           106 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'GUARULHOS',
           106 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'OSASCO',
           106 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BARUERI',
           106 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTO ANDR�',
           106 );

COMMIT;

-- MINAS GERAIS
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BELO HORIZONTE',
           107 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'UBERLANDIA',
           107 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BETIM',
           107 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JUIZ DE FORA',
           107 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BOCAIUVA',
           107 );

COMMIT;

-- BAHIA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SALVADOR',
           108 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FEIRA DE SANTANA',
           108 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VITORIA DA CONQUISTA',
           108 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JUAZEIRO',
           108 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CAMA�ARI',
           108 );

COMMIT;

-- RIO DE JANEIRO
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RIO DE JANEIRO',
           109 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NITER�I',
           109 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BELFORD ROXO',
           109 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NOVA IGUA�U',
           109 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CABO FRIO',
           109 );

COMMIT;

-- RIO GRANDE DO SUL
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PORTO ALEGRE',
           110 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CAXIAS DO SUL',
           110 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CANOAS',
           110 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PELOTAS',
           110 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA MARIA',
           110 );

COMMIT;

-- ARGENTINA -- BUENOS AIRES, MENDONZA, CORDOBA, SANTA FE, CABA

-- BUENOS AIRES
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BUENOS AIRES',
           111 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LA PLATA',
           111 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MAR DE LA PLATA',
           111 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BAHIA BLANCA',
           111 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'TANDIL',
           111 );

COMMIT;

-- MENDONZA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAN RAFAEL',
           112 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MENDONZA',
           112 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LUJAN DE CUYO',
           112 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'TANUYAN',
           112 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MALARGUE',
           112 );

COMMIT;

-- CORDOBA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CORDOBA',
           113 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLAS CARLOS PAZ',
           113 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RIO CUARTO',
           113 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTA GARCIA',
           113 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MARIA',
           113 );

COMMIT;

-- SANTA FE
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA FE',
           114 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ROSARIO',
           114 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RAFAELA',
           114 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VENADO TUERTO',
           114 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAN LORENZO',
           114 );

COMMIT;

-- CABA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PALERMO',
           115 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RECORLETO',
           115 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAN TELMO',
           115 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LA BOCA',
           115 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MICROCENTRO',
           115 );

COMMIT;

-- ALEMANHA

-- BERLIM
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PANKOW',
           116 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MITTE',
           116 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CHARLOTEENBURG-WILMESDORF',
           116 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FRIEDRICHSHAIN-KREUZBERG',
           116 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NEUKOLLN',
           116 );

COMMIT;

-- SAXONIA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'DRESDEN',
           117 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LEIPZIG',
           117 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CCHEMNITZ',
           117 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ZWICKAU',
           117 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FREIBERG',
           117 );

COMMIT;

-- HAMBURGO
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Hamburg-Mitte',
           118 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Altona',
           118 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Eimsbuttel',
           118 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Harburg',
           118 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Wandsbek',
           118 );

COMMIT;

-- BAYERN
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Munique',
           119 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Nuremberga',
           119 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Augsburgo',
           119 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Regensburg',
           119 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Wurburg',
           119 );

COMMIT;

-- TURINGIA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Erfurt',
           120 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Weimar',
           120 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Jena',
           120 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Gera',
           120 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Eisenach',
           120 );

COMMIT;

-- PORTUGAL

-- LISBOA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Baixa',
           121 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Alfama',
           121 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Areeiro',
           121 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro alto',
           121 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Belém',
           121 );

COMMIT;

-- PORTO
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Porto',
           122 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Matosinhos',
           122 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Nova de Gaia',
           122 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Maia',
           122 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Gondomar',
           122 );

COMMIT;

-- FARO
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Faro',
           123 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Albufeira',
           123 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Loulé',
           123 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Tavira',
           123 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Olhão',
           123 );

COMMIT;

-- COIMBRA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Coimbra',
           124 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Figueira da Foz',
           124 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Penela',
           124 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Nova de Poiares',
           124 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Montemor-o-Velho',
           124 );

COMMIT;

-- MADEIRA
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Funchal',
           125 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Caniço',
           125 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Santa Cruz',
           125 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Machico',
           125 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'São Vicente',
           125 );

COMMIT;

-- FRANCA

-- BRETAGNE
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Rennes',
           126 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Brest',
           126 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vannes',
           126 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Quimper',
           126 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Saint-Malo',
           126 );

COMMIT;

-- CORSE
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Ajaccio',
           127 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bastia',
           127 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Corte',
           127 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Porto-Vecchio',
           127 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Calvi',
           127 );

COMMIT;

-- HAUTS-DE-FRANCE
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Lille',
           128 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Amiens',
           128 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Roubaix',
           128 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Tourcoing',
           128 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Dunkerque',
           128 );

COMMIT;

-- NORMANDIE
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Rouen',
           129 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Caen',
           129 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Le Havre',
           129 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Évreux',
           129 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Cherbourg',
           129 );

COMMIT;

-- ILE-DE-FRANCE
INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Paris',
           130 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Versailles',
           130 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Boulogne-Billancourt',
           130 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Nanterre',
           130 );

COMMIT;

INSERT INTO cidade (
    id_cidade,
    nome_cidade,
    id_estado
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Créteil',
           130 );

COMMIT;

SELECT
    *
FROM
    cidade;

-- BAIRROS

-- SAO PAULO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MOOCA',
           131 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Mariana',
           131 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Brooklin',
           131 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Brás',
           131 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Morumbi',
           131 );

COMMIT;

-- GUARULHOS
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA ROSA',
           132 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM PARAVENTI',
           132 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA ALVORADA',
           132 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA GALVÃO',
           132 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM NOVO HORIZONTE',
           132 );

COMMIT;

-- OSASCO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA DOS REMÉDIOS',
           133 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM BELA VISTA',
           133 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA YOLANDA',
           133 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA ISA',
           133 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM SANTA MARIA',
           133 );

COMMIT;

-- BARUERI
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA PADRÃO',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALPHAVILLE',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA PORTAL',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM SILVEIRA',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM RIO CLARO',
           134 );

COMMIT;

-- SANTO ANDRÉ
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM',
           135 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA SÃO JOSÉ',
           135 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA ALVORADA',
           135 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA LUIZÃO',
           135 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA VITORIA',
           135 );

COMMIT;

-- BELO HORIZONTE
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAVASSI',
           136 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LAGOINHA',
           136 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           136 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM AMÉRICA',
           136 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM LOURDES',
           136 );

COMMIT;

-- UBERLÂNDIA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MORADA DA COLINA',
           137 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM AMÉRICA',
           137 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA RIVIERA',
           137 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA UNIÃO',
           137 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM ALVORADA',
           137 );

COMMIT;

-- BETIM
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM DAS BANDS',
           138 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA NOVA',
           138 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM MÁRTIRES',
           138 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA MARIA',
           138 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CIDADE NOVA',
           138 );

COMMIT;

-- JUIZ DE FORA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA TEREZA',
           139 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           139 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM GLÓRIA',
           139 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM BOTÂNICO',
           139 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA OSÓRIO',
           139 );

COMMIT;

-- BOCAIUVA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           140 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA SANTA LÚCIA',
           140 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM DAS LARANJEIRAS',
           140 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA MARTINS',
           140 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM BRÁS',
           140 );

COMMIT;

-- SALVADOR
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PELÔ',
           141 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ITAPUÃ',
           141 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTO ANTÔNIO',
           141 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VITÓRIA',
           141 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CABO BRANCO',
           141 );

COMMIT;

-- FEIRA DE SANTANA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           142 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM CRISTAL',
           142 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTO ANTÔNIO',
           142 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM ALVORADA',
           142 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM VITÓRIA',
           142 );

COMMIT;

-- VITÓRIA DA CONQUISTA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           143 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM VITÓRIA',
           143 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTO DO PERIMETRAL',
           143 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SÃO JORGE',
           143 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'URBIS I',
           143 );

COMMIT;

-- JUAZEIRO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           144 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM DAS ACÁCIAS',
           144 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA JOSÉ',
           144 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM FLORIDA',
           144 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA DELMIRO',
           144 );

COMMIT;

-- CAMAÇARI
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           145 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM BRAZIL',
           145 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA NOVA',
           145 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM DELMIRA',
           145 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM VITÓRIA',
           145 );

COMMIT;

-- RIO DE JANEIRO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'COPACABANA',
           146 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'IPANEMA',
           146 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LEBLON',
           146 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BARRA DA TIJUCA',
           146 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA TERESA',
           146 );

COMMIT;

-- NITERÓI
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Icaraí',
           147 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Centro',
           147 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Fonseca',
           147 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Charitas',
           147 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Cascatinha',
           147 );

COMMIT;

-- BELFORD ROXO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Centro',
           148 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Jardim Eldorado',
           148 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Eunice',
           148 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Jardim Palmeiras',
           148 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila São João',
           148 );

COMMIT;

-- NOVA IGUAÇU
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Centro',
           149 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Nova',
           149 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Jardim Alzira',
           149 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Jardim Paraíso',
           149 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Inhumas',
           149 );

COMMIT;

-- CABO FRIO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Centro',
           150 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Vila Nova',
           150 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Peró',
           150 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Praia do Forte',
           150 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Jardim Esperança',
           150 );

COMMIT;

-- PORTO ALEGRE
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           151 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MENA BARRETO',
           151 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PONTA GROSSA',
           151 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'AEROPORTO',
           151 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA IPIRANGA',
           151 );

COMMIT;

-- CAXIAS DO SUL
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           152 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA ALPINA',
           152 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CIDADE NOVA',
           152 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA LÚCIA',
           152 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BELA VISTA',
           152 );

COMMIT;

-- CANOAS
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NÃO ME TOQUE',
           153 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           153 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MORADA DO SOL',
           153 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SÃO JOSÉ',
           153 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'GUAPORÉ',
           153 );

COMMIT;

-- PELOTAS
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           154 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'AEROPORTO',
           154 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA MARIA',
           154 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'TRES VENDAS',
           154 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM EUROPA',
           154 );

COMMIT;

-- SANTA MARIA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           155 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM BRASIL',
           155 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PATRÃO',
           155 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PONTA DO DIQUE',
           155 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA BONITA',
           155 );

COMMIT;

-- SANTO ANDRÉ
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'JARDIM',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA SÃO JOSÉ',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA ALVORADA',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA LUIZÃO',
           134 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILA VITORIA',
           134 );

COMMIT;

-- LA PLATA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           157 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LA PLATA',
           157 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ELISA',
           157 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTOS DE SAN CLEMENTE',
           157 );

COMMIT;

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CICLOVIA',
           157 );

COMMIT;

-- MAR DE LA PLATA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PLAYA GRANDE',
           158 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           158 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA LA TOSCANA',
           158 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BOSQUES DE PERALTA RAMOS',
           158 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALAMBRADO',
           158 );

COMMIT;

-- BAHÍA BLANCA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           159 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MITRE',
           159 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTA CORDOBA',
           159 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ROSA',
           159 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           159 );

COMMIT;

-- TANDIL
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           160 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ANNA',
           160 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA CRESPO',
           160 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'EL PARAISO',
           160 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ESPERANZA',
           160 );

COMMIT;

-- SAN RAFAEL
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA BELGRANO',
           161 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA TOSCANA',
           161 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAN RAFAEL CENTRO',
           161 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA LOS MOLLES',
           161 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA 25 DE MAYO',
           161 );

COMMIT;

-- MENDOZA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           162 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA HUALTARÁN',
           162 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA NOGAL',
           162 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SAN MIGUEL',
           162 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SAN RAMÓN',
           162 );

COMMIT;

-- LUJAN DE CUYO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LUJAN DE CUYO',
           163 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA FLORES',
           163 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SAN MARTIN',
           163 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA JORGE',
           163 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA PALERMO',
           163 );

COMMIT;

-- TANUYAN
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           164 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA FLORES',
           164 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ELENA',
           164 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ZULEMA',
           164 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA OLGA',
           164 );

COMMIT;

-- MALARGUE
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           165 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MALARGÜE',
           165 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LOS MOLLES',
           165 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA VICTORIA',
           165 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SANTA ISABEL',
           165 );

COMMIT;

-- CORDOBA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           166 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA BELGRANO',
           166 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTA CORDOBA',
           166 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ELISA',
           166 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           166 );

COMMIT;

-- VILLAS CARLOS PAZ
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA CARLOS PAZ',
           167 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ALLENDE',
           167 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA RUMO',
           167 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MIRADOR',
           167 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA EL SALTO',
           167 );

COMMIT;

-- RIO CUARTO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           168 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA RUMO',
           168 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           168 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ALTA',
           168 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA GRANDE',
           168 );

COMMIT;

-- ALTA GARCIA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTA GARCIA',
           169 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL SOL',
           169 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA FLORES',
           169 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SAN JUAN',
           169 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MALAGÜE',
           169 );

COMMIT;

-- VILLA MARIA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           170 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA VICTORIA',
           170 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ELISA',
           170 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           170 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SAN MARTIN',
           170 );

COMMIT;

-- SANTA FE
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           171 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           171 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MARIA',
           171 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA RIVADAVIA',
           171 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SANTA TERESA',
           171 );

COMMIT;

-- ROSARIO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           172 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ELISA',
           172 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           172 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PUEBLO NUEVO',
           172 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MARIA',
           172 );

COMMIT;

-- RAFAELA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA RIVADAVIA',
           173 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           173 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           173 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA BELGRANO',
           173 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MARIA',
           173 );

COMMIT;

-- VENADO TUERTO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CENTRO',
           174 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           174 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MARIA',
           174 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ROSA',
           174 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA FLORIDA',
           174 );

COMMIT;

-- SAN LORENZO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ELISA',
           175 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAN LORENZO',
           175 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA MARIA',
           175 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           175 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA LOS MOLLES',
           175 );

COMMIT;

-- PALERMO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PALERMO SOHO',
           176 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PALERMO HOLLYWOOD',
           176 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEVOTO',
           176 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           176 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA CRESPO',
           176 );

COMMIT;

-- RECOLETA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RECOLETA',
           177 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEVOTO',
           177 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           177 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA PUEBLO NUEVO',
           177 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LA BOCA',
           177 );

COMMIT;

-- SAN TELMO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAN TELMO',
           178 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEVOTO',
           178 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA LA TOSCANA',
           178 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           178 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA LUIS',
           178 );

COMMIT;

-- LA BOCA
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LA BOCA',
           179 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA 9 DE JULIO',
           179 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DON BOSCO',
           179 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA ANNA',
           179 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA LUIS',
           179 );

COMMIT;

-- MICROCENTRO
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MICROCENTRO',
           180 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA DEL PARQUE',
           180 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA TOSCANA',
           180 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA PUEBLO NUEVO',
           180 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'VILLA SAN MARTIN',
           180 );

COMMIT;

-- MITTE
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MITTE',
           181 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'KREUZBERG',
           181 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PRINZENSTRASSE',
           181 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIN-MITTE',
           181 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIN-CHARLOTTENBURG',
           181 );

COMMIT;

-- CHARLOTEENBURG-WILMESDORF
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CHARLOTTENBURG',
           182 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WILMESDORF',
           182 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SAVIGNYPLATZ',
           182 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIN',
           182 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'KURFURSTENDAMM',
           182 );

COMMIT;

-- FRIEDRICHSHAIN-KREUZBERG
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Friedrichshain',
           183 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Kreuzberg',
           183 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIN-FRIEDRICHSHAIN',
           183 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIN-KREUZBERG',
           183 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'RAW-Gelände',
           183 );

COMMIT;

-- NEUKOLLN
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NEUKOLLN',
           184 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERLIN-NEUKOLLN',
           184 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'KOTTBUSER TOR',
           184 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SUNDGRAU',
           184 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MIRADOR',
           184 );

COMMIT;

-- DRESDEN
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           185 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NEUSTADT',
           185 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'KREUZSTRASSE',
           185 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SHUBERTSTRASSE',
           185 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'DRESDEN-ALTSTADT',
           185 );

COMMIT;

-- LEIPZIG
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ZENTRUM',
           186 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WEST',
           186 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'OST',
           186 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SOUTH',
           186 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTLINDENAU',
           186 );

COMMIT;

-- CHEMNITZ
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ZENTRUM',
           187 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MARTINLUTHER',
           187 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CHEMNITZ-OST',
           187 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CHEMNITZ-WEST',
           187 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'CHEMNITZ-SÜD',
           187 );

COMMIT;

-- ZWICKAU
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ZWICKAU-ZENTRUM',
           188 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WEST',
           188 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'OST',
           188 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SÜD',
           188 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ZWICKAU-MITTE',
           188 );

COMMIT;

-- FREIBERG
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FREIBERG-MITTE',
           189 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WILDEMAUER',
           189 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FREIBERG-NORD',
           189 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'FREIBERG-SÜD',
           189 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WILHELMSTADT',
           189 );

COMMIT;

-- Hamburg-Mitte
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HAMBURG-MITTE',
           190 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTONA',
           190 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ST. PAULI',
           190 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BERGEDORF',
           190 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NEUSTADT',
           190 );

COMMIT;

-- Altona
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTONA-ALTSTADT',
           191 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTONA-NEU',
           191 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTONA-OEST',
           191 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTONA-OST',
           191 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTONA-NORD',
           191 );

COMMIT;

-- Eimsbuttel
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'EIMSBUTTEL',
           192 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'EIMSBUTTEL-NORD',
           192 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'EIMSBUTTEL-OST',
           192 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'EIMSBUTTEL-SÜD',
           192 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'EIMSBUTTEL-MITTE',
           192 );

COMMIT;

-- Harburg
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HARBURG',
           193 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HARBURG-OST',
           193 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HARBURG-SÜD',
           193 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HARBURG-NORD',
           193 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HARBURG-WEST',
           193 );

COMMIT;

-- Wandsbek
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WANDSBK',
           194 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WANDSBK-NORD',
           194 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WANDSBK-OST',
           194 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WANDSBK-SÜD',
           194 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WANDSBK-MITTE',
           194 );

COMMIT;

-- Munique
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           195 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LEOPOLDSTADT',
           195 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HAIDHAUSEN',
           195 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MAXVORSTADT',
           195 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SENDLING',
           195 );

COMMIT;

-- Nuremberga
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           196 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'GIBITZGRUND',
           196 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'STEGNERSTRASSE',
           196 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HARTENSTRASSE',
           196 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'THOMASSENSTRASSE',
           196 );

COMMIT;

-- Augsburgo
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           197 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LINDENAU',
           197 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HAIDHAUSEN',
           197 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PARKSTADT',
           197 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SCHWABEN',
           197 );

COMMIT;

-- Regensburg
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'REGELGELAND',
           198 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'HAFEN',
           198 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'GEDECKED',
           198 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSATDT',
           198 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'KIEFERGARTEN',
           198 );

COMMIT;

-- Würzburg
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           199 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LINDENFELD',
           199 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ZENTRAL',
           199 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NORDEN',
           199 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SÜD',
           199 );

COMMIT;

-- Erfurt
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           200 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WILHELMSHOHE',
           200 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'INNERSTADT',
           200 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'MORITZWEG',
           200 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'KRÄMERBRÜCKE',
           200 );

COMMIT;

-- Weimar
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'DREI GLOCKEN',
           201 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           201 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'NEUSTADT',
           201 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'PARKWEG',
           201 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'WILHELMSFELD',
           201 );

COMMIT;

-- Jena
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'ALTSTADT',
           202 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'LOHBERG',
           202 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BÖHLEN',
           202 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'BÜHLER',
           202 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'SCHNEIDERS',
           202 );

COMMIT;

-- Gera
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Gera',
           203 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Gera',
           203 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Gera',
           203 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Gera',
           203 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Gera',
           203 );

COMMIT;

-- Eisenach
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Eisenach',
           204 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Eisenach',
           204 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Eisenach',
           204 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Eisenach',
           204 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Eisenach',
           204 );

COMMIT;

-- Alfama
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Alfama',
           205 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Alfama',
           205 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Alfama',
           205 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Alfama',
           205 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Alfama',
           205 );

COMMIT;

-- Areeiro
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Areeiro',
           206 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Areeiro',
           206 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Areeiro',
           206 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Areeiro',
           206 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Areeiro',
           206 );

COMMIT;

-- Bairro Alto
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Bairro Alto',
           207 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Bairro Alto',
           207 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Bairro Alto',
           207 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Bairro Alto',
           207 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Bairro Alto',
           207 );

COMMIT;

-- Belém
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Belém',
           208 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Belém',
           208 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Belém',
           208 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Belém',
           208 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Belém',
           208 );

COMMIT;

-- Porto
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Porto',
           209 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Porto',
           209 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Porto',
           209 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Porto',
           209 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Porto',
           209 );

COMMIT;

-- Matosinhos
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Matosinhos',
           210 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Matosinhos',
           210 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Matosinhos',
           210 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Matosinhos',
           210 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Matosinhos',
           210 );

COMMIT;

-- Vila Nova de Gaia
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Vila Nova de Gaia',
           211 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Vila Nova de Gaia',
           211 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Vila Nova de Gaia',
           211 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Vila Nova de Gaia',
           211 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Vila Nova de Gaia',
           211 );

COMMIT;

-- Maia
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Maia',
           212 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Maia',
           212 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Maia',
           212 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Maia',
           212 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Maia',
           212 );

COMMIT;

-- Gondomar
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Gondomar',
           213 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Gondomar',
           213 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Gondomar',
           213 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Gondomar',
           213 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Gondomar',
           213 );

COMMIT;

-- Faro
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Faro',
           214 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Faro',
           214 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Faro',
           214 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Faro',
           214 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Faro',
           214 );

COMMIT;

-- Albufeira
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Albufeira',
           215 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Albufeira',
           215 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Albufeira',
           215 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Albufeira',
           215 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Albufeira',
           215 );

COMMIT;

-- Loulé
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Loulé',
           216 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Loulé',
           216 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Loulé',
           216 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Loulé',
           216 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Loulé',
           216 );

COMMIT;

-- Tavira
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Tavira',
           217 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Tavira',
           217 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Tavira',
           217 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Tavira',
           217 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Tavira',
           217 );

COMMIT;

-- Olhão
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Olhão',
           218 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Olhão',
           218 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Olhão',
           218 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Olhão',
           218 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Olhão',
           218 );

COMMIT;

-- Coimbra
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Coimbra',
           219 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Coimbra',
           219 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Coimbra',
           219 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Coimbra',
           219 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Coimbra',
           219 );

COMMIT;

-- Figueira da Foz
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Figueira da Foz',
           220 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Figueira da Foz',
           220 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Figueira da Foz',
           220 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Figueira da Foz',
           220 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Figueira da Foz',
           220 );

COMMIT;

-- Penela
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Penela',
           221 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Penela',
           221 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Penela',
           221 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Penela',
           221 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Penela',
           221 );

COMMIT;

-- Vila Nova de Poiares
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Vila Nova de Poiares',
           222 );

COMMIT;

-- Montemor-o-Velho
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Montemor-o-Velho',
           223 );

COMMIT;

-- Funchal
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Funchal',
           224 );

COMMIT;

-- Caniço
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Caniço',
           225 );

COMMIT;

-- Santa Cruz
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Santa Cruz',
           226 );

COMMIT;

-- Machico
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Machico',
           227 );

COMMIT;

-- São Vicente
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 São Vicente',
           228 );

COMMIT;

-- Rennes
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Rennes',
           229 );

COMMIT;

-- Brest
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Brest',
           230 );

COMMIT;

-- Vannes
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Vannes',
           231 );

COMMIT;

-- Quimper
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Quimper',
           232 );

COMMIT;

-- Saint-Malo
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Saint-Malo',
           233 );

COMMIT;

-- Ajaccio
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Ajaccio',
           234 );

COMMIT;

-- Bastia
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Bastia',
           235 );

COMMIT;

-- Corte
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Corte',
           236 );

COMMIT;

-- Porto-Vecchio
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Porto-Vecchio',
           237 );

COMMIT;

-- Calvi
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Calvi',
           238 );

COMMIT;

-- Lille
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Lille',
           239 );

COMMIT;

-- Amiens
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Amiens',
           240 );

COMMIT;

-- Roubaix
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Roubaix',
           241 );

COMMIT;

-- Tourcoing
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Tourcoing',
           242 );

COMMIT;

-- Dunkerque
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Dunkerque',
           243 );

COMMIT;

-- Rouen
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Rouen',
           244 );

COMMIT;

-- Caen
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Caen',
           245 );

COMMIT;

-- Le Havre
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Le Havre',
           246 );

COMMIT;

-- Évreux
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Évreux',
           247 );

COMMIT;

-- Cherbourg
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Cherbourg',
           248 );

COMMIT;

-- Paris
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Paris',
           249 );

COMMIT;

-- Versailles
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Versailles',
           250 );

COMMIT;

-- Boulogne-Billancourt
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Boulogne-Billancourt',
           251 );

COMMIT;

-- Nanterre
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Nanterre',
           252 );

COMMIT;

-- Créteil
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Créteil',
           253 );

COMMIT;

SELECT
    *
FROM
    bairro;airro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Penela',
           221 );

COMMIT;

-- Vila Nova de Poiares
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Vila Nova de Poiares',
           222 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Vila Nova de Poiares',
           222 );

COMMIT;

-- Montemor-o-Velho
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Montemor-o-Velho',
           223 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Montemor-o-Velho',
           223 );

COMMIT;

-- Funchal
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Funchal',
           224 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Funchal',
           224 );

COMMIT;

-- Caniço
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Caniço',
           225 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Caniço',
           225 );

COMMIT;

-- Santa Cruz
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Santa Cruz',
           226 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Santa Cruz',
           226 );

COMMIT;

-- Machico
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Machico',
           227 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Machico',
           227 );

COMMIT;

-- São Vicente
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 São Vicente',
           228 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 São Vicente',
           228 );

COMMIT;

-- Rennes
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Rennes',
           229 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Rennes',
           229 );

COMMIT;

-- Brest
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Brest',
           230 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Brest',
           230 );

COMMIT;

-- Vannes
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Vannes',
           231 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Vannes',
           231 );

COMMIT;

-- Quimper
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Quimper',
           232 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Quimper',
           232 );

COMMIT;

-- Saint-Malo
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Saint-Malo',
           233 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Saint-Malo',
           233 );

COMMIT;

-- Ajaccio
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Ajaccio',
           234 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Ajaccio',
           234 );

COMMIT;

-- Bastia
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Bastia',
           235 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Bastia',
           235 );

COMMIT;

-- Corte
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Corte',
           236 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Corte',
           236 );

COMMIT;

-- Porto-Vecchio
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Porto-Vecchio',
           237 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Porto-Vecchio',
           237 );

COMMIT;

-- Calvi
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Calvi',
           238 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Calvi',
           238 );

COMMIT;

-- Lille
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Lille',
           239 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Lille',
           239 );

COMMIT;

-- Amiens
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Amiens',
           240 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Amiens',
           240 );

COMMIT;

-- Roubaix
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Roubaix',
           241 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Roubaix',
           241 );

COMMIT;

-- Tourcoing
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Tourcoing',
           242 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Tourcoing',
           242 );

COMMIT;

-- Dunkerque
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Dunkerque',
           243 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Dunkerque',
           243 );

COMMIT;

-- Rouen
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Rouen',
           244 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Rouen',
           244 );

COMMIT;

-- Caen
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Caen',
           245 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Caen',
           245 );

COMMIT;

-- Le Havre
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Le Havre',
           246 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Le Havre',
           246 );

COMMIT;

-- Évreux
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Évreux',
           247 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Évreux',
           247 );

COMMIT;

-- Cherbourg
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Cherbourg',
           248 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Cherbourg',
           248 );

COMMIT;

-- Paris
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Paris',
           249 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Paris',
           249 );

COMMIT;

-- Versailles
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Versailles',
           250 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Versailles',
           250 );

COMMIT;

-- Boulogne-Billancourt
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Boulogne-Billancourt',
           251 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Boulogne-Billancourt',
           251 );

COMMIT;

-- Nanterre
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Nanterre',
           252 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Nanterre',
           252 );

COMMIT;

-- Créteil
INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 1 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 2 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 3 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 4 Créteil',
           253 );

INSERT INTO bairro (
    id_bairro,
    nome_bairro,
    id_cidade
) VALUES ( sq_aula_ddl.NEXTVAL,
           'Bairro 5 Créteil',
           253 );

COMMIT;

SELECT
    *
FROM
    bairro;