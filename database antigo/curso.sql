--
-- File generated with SQLiteStudio v3.3.3 on qui jun 23 19:09:32 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: categoria
CREATE TABLE categoria (
    id   INTEGER       PRIMARY KEY
                       NOT NULL,
    nome VARCHAR (200) 
);

INSERT INTO categoria (
                          id,
                          nome
                      )
                      VALUES (
                          1,
                          'Frequente'
                      );

INSERT INTO categoria (
                          id,
                          nome
                      )
                      VALUES (
                          2,
                          'Casual'
                      );

INSERT INTO categoria (
                          id,
                          nome
                      )
                      VALUES (
                          3,
                          'Varejista'
                      );


-- Table: cidade
CREATE TABLE cidade (
    id        INTEGER       PRIMARY KEY
                            NOT NULL,
    nome      VARCHAR (200),
    estado_id INTEGER       NOT NULL,
    FOREIGN KEY (
        estado_id
    )
    REFERENCES estado (id) 
);

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       1,
                       'Lajeado',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       2,
                       'Porto Alegre',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       3,
                       'Caxias do Sul',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       4,
                       'São Paulo',
                       2
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       5,
                       'Osasco',
                       2
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       6,
                       'Rondon?polis',
                       3
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       7,
                       'Rondonopolis',
                       3
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       9,
                       'Teste',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       11,
                       'Teste',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       12,
                       'Teste 2',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       13,
                       'teste',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       16,
                       'LAJEADO',
                       1
                   );

INSERT INTO cidade (
                       id,
                       nome,
                       estado_id
                   )
                   VALUES (
                       17,
                       'SÃO PAULO2',
                       2
                   );


-- Table: cliente
CREATE TABLE cliente (
    id           INTEGER       PRIMARY KEY
                               NOT NULL,
    nome         VARCHAR (200),
    endereco     VARCHAR (200),
    telefone     VARCHAR (200),
    nascimento   DATE,
    situacao     CHAR (1),
    email        VARCHAR (200),
    genero       CHAR (1),
    categoria_id INTEGER       NOT NULL,
    cidade_id    INTEGER       NOT NULL,
    created_at   TIMESTAMP,
    updated_at   TIMESTAMP,
    FOREIGN KEY (
        cidade_id
    )
    REFERENCES cidade (id),
    FOREIGN KEY (
        categoria_id
    )
    REFERENCES categoria (id) 
);

INSERT INTO cliente (
                        id,
                        nome,
                        endereco,
                        telefone,
                        nascimento,
                        situacao,
                        email,
                        genero,
                        categoria_id,
                        cidade_id,
                        created_at,
                        updated_at
                    )
                    VALUES (
                        1,
                        'FABIO HENRIQUE SOARES LIMA',
                        'Av Castro Alves',
                        '+556696204109',
                        '1989-05-18',
                        'Y',
                        'sis.flima@gmail.com',
                        'M',
                        1,
                        7,
                        '2022-05-25 19:46:33',
                        '2022-05-26 16:38:52'
                    );

INSERT INTO cliente (
                        id,
                        nome,
                        endereco,
                        telefone,
                        nascimento,
                        situacao,
                        email,
                        genero,
                        categoria_id,
                        cidade_id,
                        created_at,
                        updated_at
                    )
                    VALUES (
                        2,
                        'ALEXIA CRISTINA DE OLIVEIRA BRITO',
                        'AVENIDA ALAMEDAS DAS ROSAS',
                        '+556696204109',
                        '1993-05-25',
                        'Y',
                        'alexia22ka@gmail.com',
                        'F',
                        1,
                        7,
                        '2022-05-25 21:13:07',
                        '2022-05-26 16:38:45'
                    );

INSERT INTO cliente (
                        id,
                        nome,
                        endereco,
                        telefone,
                        nascimento,
                        situacao,
                        email,
                        genero,
                        categoria_id,
                        cidade_id,
                        created_at,
                        updated_at
                    )
                    VALUES (
                        3,
                        'TRANSPORTADORA BRASIL CENTRAL LTDA',
                        'GUARAPARI 1250. VETORASSO MENDES',
                        '6634262618',
                        '2022-06-23',
                        'Y',
                        'sis.flima@gmail.com',
                        'M',
                        1,
                        1,
                        '2022-06-23 09:28:02',
                        NULL
                    );


-- Table: cliente_habilidade
CREATE TABLE cliente_habilidade (
    id            INTEGER PRIMARY KEY
                          NOT NULL,
    cliente_id    INTEGER NOT NULL,
    habilidade_id INTEGER NOT NULL,
    FOREIGN KEY (
        cliente_id
    )
    REFERENCES cliente (id),
    FOREIGN KEY (
        habilidade_id
    )
    REFERENCES habilidade (id) 
);

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   66,
                                   6,
                                   5
                               );

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   67,
                                   6,
                                   7
                               );

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   71,
                                   40,
                                   3
                               );

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   77,
                                   4,
                                   1
                               );

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   78,
                                   4,
                                   2
                               );

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   79,
                                   4,
                                   7
                               );

INSERT INTO cliente_habilidade (
                                   id,
                                   cliente_id,
                                   habilidade_id
                               )
                               VALUES (
                                   80,
                                   2,
                                   3
                               );


-- Table: conta_receber
CREATE TABLE conta_receber (
    id            INTEGER     PRIMARY KEY AUTOINCREMENT
                              NOT NULL,
    dt_emissao    DATE        NOT NULL,
    dt_pagamento  DATE,
    dt_vencimento DATE        NOT NULL,
    cliente_id    INTEGER     REFERENCES cliente (id),
    valor         FLOAT,
    obs           VARCHAR,
    mes           INTEGER (2),
    ano           INTEGER (4),
    ativo         STRING (1) 
);

INSERT INTO conta_receber (
                              id,
                              dt_emissao,
                              dt_pagamento,
                              dt_vencimento,
                              cliente_id,
                              valor,
                              obs,
                              mes,
                              ano,
                              ativo
                          )
                          VALUES (
                              1,
                              '2022-06-22',
                              NULL,
                              '2022-06-30',
                              3,
                              1000.0,
                              'CLIENTE VAI FAZER TRANSFERENCIA BANCARIA.',
                              6,
                              2022,
                              'Y'
                          );

INSERT INTO conta_receber (
                              id,
                              dt_emissao,
                              dt_pagamento,
                              dt_vencimento,
                              cliente_id,
                              valor,
                              obs,
                              mes,
                              ano,
                              ativo
                          )
                          VALUES (
                              2,
                              '2022-06-22',
                              '2022-06-23',
                              '2022-06-30',
                              NULL,
                              1300.0,
                              'cliente vai pagar via boleto.',
                              6,
                              2022,
                              'Y'
                          );

INSERT INTO conta_receber (
                              id,
                              dt_emissao,
                              dt_pagamento,
                              dt_vencimento,
                              cliente_id,
                              valor,
                              obs,
                              mes,
                              ano,
                              ativo
                          )
                          VALUES (
                              3,
                              '2022-06-23',
                              '2022-06-24',
                              '2022-06-25',
                              NULL,
                              1066.0,
                              NULL,
                              6,
                              2022,
                              'Y'
                          );

INSERT INTO conta_receber (
                              id,
                              dt_emissao,
                              dt_pagamento,
                              dt_vencimento,
                              cliente_id,
                              valor,
                              obs,
                              mes,
                              ano,
                              ativo
                          )
                          VALUES (
                              4,
                              '2022-06-23',
                              NULL,
                              '2022-06-30',
                              3,
                              1825.0,
                              NULL,
                              6,
                              2022,
                              'Y'
                          );


-- Table: contato
CREATE TABLE contato (
    id         INTEGER       PRIMARY KEY
                             NOT NULL,
    tipo       VARCHAR (200),
    valor      VARCHAR (200),
    cliente_id INTEGER       NOT NULL,
    FOREIGN KEY (
        cliente_id
    )
    REFERENCES cliente (id) 
);

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        8,
                        'email',
                        'teste@teste.com',
                        40
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        12,
                        'telefone',
                        '78 2343-4545',
                        4
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        13,
                        'telefone',
                        '78 9494-0404',
                        4
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        14,
                        'telefone',
                        '78 2343-4545',
                        4
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        15,
                        'telefone',
                        '78 9494-0404',
                        4
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        16,
                        'email',
                        'teste@teste.com',
                        4
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        19,
                        'telefone',
                        'fasdfafa',
                        2
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        20,
                        'email',
                        'fsdfasdfas',
                        2
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        21,
                        'telefone',
                        '465456454564654',
                        1
                    );

INSERT INTO contato (
                        id,
                        tipo,
                        valor,
                        cliente_id
                    )
                    VALUES (
                        22,
                        'telefone',
                        '41651651561',
                        1
                    );


-- Table: estado
CREATE TABLE estado (
    id   INTEGER       PRIMARY KEY
                       NOT NULL,
    nome VARCHAR (200) 
);

INSERT INTO estado (
                       id,
                       nome
                   )
                   VALUES (
                       1,
                       'RS'
                   );

INSERT INTO estado (
                       id,
                       nome
                   )
                   VALUES (
                       2,
                       'SP'
                   );

INSERT INTO estado (
                       id,
                       nome
                   )
                   VALUES (
                       3,
                       'MT'
                   );

INSERT INTO estado (
                       id,
                       nome
                   )
                   VALUES (
                       4,
                       'MS'
                   );


-- Table: estoque
CREATE TABLE estoque (
    id         INTEGER      PRIMARY KEY AUTOINCREMENT,
    nome       VARCHAR (20) NOT NULL,
    quantidade INTEGER      NOT NULL
);

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        1,
                        'Rack 20',
                        50
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        2,
                        'Rack 40',
                        55
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        3,
                        'Rack 42',
                        50
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        4,
                        'Rack 44',
                        50
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        5,
                        'Rack 46',
                        5
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        6,
                        'Perfil',
                        1
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        7,
                        'Cola preta (litros)',
                        2
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        8,
                        'Banda Lisa usada',
                        4
                    );

INSERT INTO estoque (
                        id,
                        nome,
                        quantidade
                    )
                    VALUES (
                        9,
                        'Banda Borrachuda usada',
                        5
                    );


-- Table: habilidade
CREATE TABLE habilidade (
    id   INTEGER       PRIMARY KEY
                       NOT NULL,
    nome VARCHAR (200) 
);

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           1,
                           'Leitura'
                       );

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           2,
                           'Escrita'
                       );

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           3,
                           'Comunicação'
                       );

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           4,
                           'Criatividade'
                       );

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           5,
                           'Relações'
                       );

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           6,
                           'Organização'
                       );

INSERT INTO habilidade (
                           id,
                           nome
                       )
                       VALUES (
                           7,
                           'Liderança'
                       );


-- Table: orcamento
CREATE TABLE orcamento (
    id           INTEGER     PRIMARY KEY AUTOINCREMENT,
    dt_orcamento DATE,
    total        REAL,
    cliente_id   STRING      REFERENCES cliente (id),
    obs          STRING (25) 
);

INSERT INTO orcamento (
                          id,
                          dt_orcamento,
                          total,
                          cliente_id,
                          obs
                      )
                      VALUES (
                          1,
                          '2022-06-19',
                          1500.0,
                          2,
                          ''
                      );

INSERT INTO orcamento (
                          id,
                          dt_orcamento,
                          total,
                          cliente_id,
                          obs
                      )
                      VALUES (
                          2,
                          '2022-06-23',
                          1500.0,
                          2,
                          'fdsfa'
                      );


-- Table: orcamento_item
CREATE TABLE orcamento_item (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    preco_venda  NUMERIC REFERENCES produto (preco_venda),
    quantidade   INTEGER NOT NULL,
    desconto     NUMERIC,
    total        NUMERIC NOT NULL,
    produto_id   STRING  REFERENCES produto (id) ON UPDATE NO ACTION,
    orcamento_id INTEGER REFERENCES orcamento (id) 
);

INSERT INTO orcamento_item (
                               id,
                               preco_venda,
                               quantidade,
                               desconto,
                               total,
                               produto_id,
                               orcamento_id
                           )
                           VALUES (
                               1,
                               150,
                               3,
                               '',
                               450,
                               4,
                               1
                           );


-- Table: produto
CREATE TABLE produto (
    id          INTEGER       PRIMARY KEY AUTOINCREMENT,
    descricao   VARCHAR (200),
    estoque     INTEGER,
    preco_venda FLOAT,
    unidade     VARCHAR (200),
    local_foto  TEXT
);

INSERT INTO produto (
                        id,
                        descricao,
                        estoque,
                        preco_venda,
                        unidade,
                        local_foto
                    )
                    VALUES (
                        1,
                        'PNEU RECAPADO BORRACHUDO',
                        100,
                        1700.0,
                        'UN',
                        NULL
                    );

INSERT INTO produto (
                        id,
                        descricao,
                        estoque,
                        preco_venda,
                        unidade,
                        local_foto
                    )
                    VALUES (
                        2,
                        'PNEU RECAPADO LISO ',
                        100,
                        1350.0,
                        'UN',
                        NULL
                    );

INSERT INTO produto (
                        id,
                        descricao,
                        estoque,
                        preco_venda,
                        unidade,
                        local_foto
                    )
                    VALUES (
                        3,
                        'CONSERTO SIMPLES',
                        100,
                        150.0,
                        'UN',
                        ''
                    );

INSERT INTO produto (
                        id,
                        descricao,
                        estoque,
                        preco_venda,
                        unidade,
                        local_foto
                    )
                    VALUES (
                        4,
                        'CONSERTO ENCHIMENTO',
                        91,
                        180.0,
                        'UN',
                        NULL
                    );


-- Table: produto_imagem
CREATE TABLE produto_imagem (
    id         INTEGER PRIMARY KEY
                       NOT NULL,
    produto_id INTEGER REFERENCES produto (id),
    imagem     TEXT
);

INSERT INTO produto_imagem (
                               id,
                               produto_id,
                               imagem
                           )
                           VALUES (
                               1,
                               1,
                               'files/imagems/1/libreoffice-oasis-text-template.png'
                           );

INSERT INTO produto_imagem (
                               id,
                               produto_id,
                               imagem
                           )
                           VALUES (
                               2,
                               1,
                               'files/imagems/1/libreoffice-oasis-web-template.png'
                           );


-- Table: produto_orcamento
CREATE TABLE produto_orcamento (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    nome          VARCHAR,
    preco_produto FLOAT,
    quantidade    INTEGER
);

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  1,
                                  'Pneu 295',
                                  1300.0,
                                  10
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  2,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  3,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  4,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  5,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  6,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  7,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  8,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  9,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  10,
                                  NULL,
                                  10.0,
                                  NULL
                              );

INSERT INTO produto_orcamento (
                                  id,
                                  nome,
                                  preco_produto,
                                  quantidade
                              )
                              VALUES (
                                  11,
                                  '10',
                                  NULL,
                                  NULL
                              );


-- Table: venda
CREATE TABLE venda (
    id         INTEGER PRIMARY KEY
                       NOT NULL,
    dt_venda   DATE,
    total      REAL,
    cliente_id INT,
    obs        TEXT,
    FOREIGN KEY (
        cliente_id
    )
    REFERENCES cliente (id) 
);

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      1,
                      '10/06/2022',
                      3500.0,
                      2,
                      'VEIO BUSCAR'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      2,
                      '10/06/2022',
                      17500.0,
                      1,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      3,
                      '12/06/2022',
                      1800.0,
                      1,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      4,
                      '16/06/2022',
                      1980.0,
                      1,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      5,
                      '18/06/2022',
                      15500.0,
                      1,
                      'aguardar confirmação'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      6,
                      '18/06/2022',
                      900.0,
                      1,
                      'eperar confirmaçaõ'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      7,
                      '18/06/2022',
                      1350.0,
                      2,
                      'ESPERAR CONFIRMAÇAÕ'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      8,
                      NULL,
                      300.0,
                      2,
                      'fsdfasdfas'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      9,
                      NULL,
                      1800.0,
                      2,
                      'dfadfadfa'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      10,
                      NULL,
                      6750.0,
                      2,
                      'fadsfadsfas'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      11,
                      '18/06/2022',
                      360.0,
                      1,
                      'fsdfas'
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      12,
                      '18/06/2022',
                      5940.0,
                      1,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      13,
                      '18/06/2022',
                      44550.0,
                      1,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      14,
                      '19/06/2022',
                      360.0,
                      2,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      15,
                      '23/06/2022',
                      540.0,
                      1,
                      NULL
                  );

INSERT INTO venda (
                      id,
                      dt_venda,
                      total,
                      cliente_id,
                      obs
                  )
                  VALUES (
                      16,
                      '30/06/2022',
                      720.0,
                      3,
                      'fadfasfasfa'
                  );


-- Table: venda_item
CREATE TABLE venda_item (
    id          INTEGER PRIMARY KEY
                        NOT NULL,
    preco_venda FLOAT,
    quantidade  FLOAT,
    desconto    FLOAT,
    total       FLOAT,
    produto_id  INT     REFERENCES produto (id),
    venda_id    INT,
    FOREIGN KEY (
        produto_id
    )
    REFERENCES produto (id),
    FOREIGN KEY (
        venda_id
    )
    REFERENCES venda (id) 
);

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           1,
                           1750.0,
                           2.0,
                           0.0,
                           3500.0,
                           1,
                           1
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           2,
                           1750.0,
                           10.0,
                           0.0,
                           17500.0,
                           1,
                           2
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           3,
                           180.0,
                           10.0,
                           0.0,
                           1800.0,
                           4,
                           3
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           4,
                           150.0,
                           6.0,
                           0.0,
                           900.0,
                           3,
                           4
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           5,
                           180.0,
                           6.0,
                           0.0,
                           1080.0,
                           4,
                           4
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           6,
                           1550.0,
                           10.0,
                           0.0,
                           15500.0,
                           1,
                           5
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           7,
                           150.0,
                           6.0,
                           0.0,
                           900.0,
                           4,
                           6
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           8,
                           135.0,
                           10.0,
                           0.0,
                           1350.0,
                           3,
                           7
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           9,
                           150.0,
                           2.0,
                           0.0,
                           300.0,
                           4,
                           8
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           10,
                           150.0,
                           12.0,
                           0.0,
                           1800.0,
                           1,
                           9
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           11,
                           150.0,
                           45.0,
                           0.0,
                           6750.0,
                           4,
                           10
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           12,
                           180.0,
                           2.0,
                           0.0,
                           360.0,
                           4,
                           11
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           13,
                           180.0,
                           33.0,
                           0.0,
                           5940.0,
                           4,
                           12
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           14,
                           1350.0,
                           33.0,
                           0.0,
                           44550.0,
                           2,
                           13
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           15,
                           180.0,
                           2.0,
                           0.0,
                           360.0,
                           4,
                           14
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           16,
                           180.0,
                           3.0,
                           0.0,
                           540.0,
                           4,
                           15
                       );

INSERT INTO venda_item (
                           id,
                           preco_venda,
                           quantidade,
                           desconto,
                           total,
                           produto_id,
                           venda_id
                       )
                       VALUES (
                           17,
                           180.0,
                           4.0,
                           0.0,
                           720.0,
                           4,
                           16
                       );


-- Trigger: Tgr_ItensVenda_Delete
CREATE TRIGGER Tgr_ItensVenda_Delete
         AFTER DELETE
            ON venda_item
      FOR EACH ROW
BEGIN
    UPDATE produto
       SET estoque = estoque + OLD.quantidade
     WHERE id = OLD.produto_id;
END;


-- Trigger: Tgr_ItensVenda_insert
CREATE TRIGGER Tgr_ItensVenda_insert
         AFTER INSERT
            ON venda_item
      FOR EACH ROW
BEGIN
    UPDATE produto
       SET estoque = estoque - NEW.quantidade
     WHERE id = NEW.produto_id;
END;


-- View: 
CREATE VIEW "" AS
    SELECT *
      FROM produto;


-- View: view_vendas
CREATE VIEW view_vendas AS
    SELECT id,
           nome,
           endereco,
           telefone,
           nascimento,
           situacao,
           email,
           genero,
           cidade_id,
           categoria_id,
           (
               SELECT sum(total) 
                 FROM venda
                WHERE cliente_id = cliente.id
           )
           AS total,
           (
               SELECT max(dt_venda) 
                 FROM venda
                WHERE cliente_id = cliente.id
           )
           AS last_date
      FROM cliente;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
