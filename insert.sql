
SELECT * FROM tbl_usuario;
SELECT * FROM tbl_pessoa_fisica;
SELECT * FROM tbl_gerador;
SELECT * FROM tbl_endereco;
SELECT * FROM tbl_usuario_endereco;

INSERT INTO tbl_usuario(
	telefone,
    email,
    senha
) VALUES (
	'11 98627-1996',
    'teste@gmail.com',
    'senha123teste'
), (
	'11 08126-1996',
    'teste@gmail.com',
    'senhateste'
);

INSERT INTO tbl_pessoa_fisica(
	nome,
    cpf,
    data_nascimento,
    id_usuario
) VALUES (
	'Larissa Nunes',
    '468.905.348.08',
    '2005-08-23',
    1
), (
	'Ana',
    '421.675.348.00',
    '2006-01-04',
    2
);

INSERT INTO tbl_gerador(
	id_usuario
) VALUES (
	1
);

INSERT INTO tbl_endereco (
	logradouro,
    bairro,
    cidade,
    estado,
    cep,
    complemento
) VALUES (
	'Rua Padre Vieira 345',
    'Piratininga',
    'Osasco',
    'São Paulo',
    '06230-080',
    NULL
), (
	'Rua Padre Vieira 123',
    'Piratininga',
    'Osasco',
    'São Paulo',
    '06230-184',
    NULL
);

INSERT INTO tbl_usuario_endereco(
	id_usuario,
    id_endereco
) VALUES (
	1,
    1
), (
	2,
    2
);

INSERT INTO tbl_catador(
	id_usuario
) VALUES (
	2
);
