USE db_zerowaste;
SHOW TABLES;

SELECT * FROM tbl_usuario;
SELECT * FROM tbl_pessoa_fisica;
SELECT * FROM tbl_pessoa_juridica;
SELECT * FROM tbl_catador;
SELECT * FROM tbl_gerador;
SELECT * FROM tbl_endereco;
SELECT * FROM tbl_endereco_usuario;
SELECT * FROM tbl_materiais;
SELECT * FROM tbl_materiais_catador;
SELECT * FROM tbl_pedido;
SELECT * FROM tbl_materiais_pedido;

SELECT * FROM tbl_materiais_catador 
WHERE id_materiais in (1,2) AND id_catador NOT IN(SELECT id_catador
FROM tbl_materiais_catador 
WHERE id_materiais in (1,2) GROUP BY  id_catador having count(id_catador) <> 2); 

#
SELECT id_catador
FROM tbl_materiais_catador 
WHERE id_materiais in (1,2) GROUP BY id_catador HAVING count(id_catador) >= (SELECT count(*) AS id FROM tbl_materiais WHERE id IN(1,2));

SELECT count(*) as id FROM tbl_materiais where id in(1,2);


SELECT id FROM tbl_catador;

SELECT * FROM tbl_materiais_catador where id_materiais <> 1 and id_materiais <> 2;




# retorna a data no formato brasileiro
SELECT DATE_FORMAT (data_nascimento, '%d/%m/%y') AS data_nascimento FROM tbl_pessoa_fisica;

# retorna todos os dados de um usuario gerador pessoa física por id
SELECT tbl_usuario.telefone, tbl_usuario.email, tbl_usuario.senha,
tbl_pessoa_fisica.nome, tbl_pessoa_fisica.cpf, tbl_pessoa_fisica.data_nascimento,
tbl_endereco.logradouro,tbl_endereco.bairro,tbl_endereco.cidade, tbl_endereco.estado,tbl_endereco.cep, tbl_endereco.complemento,
tbl_endereco_usuario.id_usuario, tbl_endereco_usuario.id_endereco
FROM tbl_usuario
INNER JOIN tbl_pessoa_fisica 
	ON tbl_usuario.id = tbl_pessoa_fisica.id_usuario
INNER JOIN tbl_gerador
	ON tbl_usuario.id = tbl_gerador.id_usuario
INNER JOIN tbl_endereco_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
INNER JOIN tbl_endereco
	ON tbl_endereco.id = tbl_endereco_usuario.id_endereco
WHERE tbl_gerador.id = 1;

# retorna todos os dados de um usuario gerador pessoa juridica por id
SELECT tbl_usuario.telefone, tbl_usuario.email, tbl_usuario.senha,
tbl_pessoa_juridica.nome_fantasia, tbl_pessoa_juridica.cnpj,
tbl_endereco.logradouro,tbl_endereco.bairro,tbl_endereco.cidade, tbl_endereco.estado,tbl_endereco.cep, tbl_endereco.complemento,
tbl_endereco_usuario.id_usuario, tbl_endereco_usuario.id_endereco
FROM tbl_usuario
INNER JOIN tbl_pessoa_juridica 
	ON tbl_usuario.id = tbl_pessoa_juridica.id_usuario
INNER JOIN tbl_gerador
	ON tbl_usuario.id = tbl_gerador.id_usuario
INNER JOIN tbl_endereco_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
INNER JOIN tbl_endereco
	ON tbl_endereco.id = tbl_endereco_usuario.id_endereco
WHERE tbl_gerador.id = 1;

# retorna todos os dados de um usuario catador pessoa física por id
SELECT tbl_usuario.telefone, tbl_usuario.email, tbl_usuario.senha,
tbl_pessoa_fisica.nome, tbl_pessoa_fisica.cpf, tbl_pessoa_fisica.data_nascimento,
tbl_endereco.logradouro,tbl_endereco.bairro,tbl_endereco.cidade, tbl_endereco.estado,tbl_endereco.cep, tbl_endereco.complemento,
tbl_endereco_usuario.id_usuario, tbl_endereco_usuario.id_endereco
FROM tbl_usuario
INNER JOIN tbl_pessoa_fisica 
	ON tbl_usuario.id = tbl_pessoa_fisica.id_usuario
INNER JOIN tbl_catador
	ON tbl_usuario.id = tbl_catador.id_usuario
INNER JOIN tbl_endereco_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
INNER JOIN tbl_endereco
	ON tbl_endereco.id = tbl_endereco_usuario.id_endereco
WHERE tbl_catador.id = 1;

# retorna todos os dados de um usuario catador pessoa juridica por id
SELECT tbl_usuario.telefone, tbl_usuario.email, tbl_usuario.senha,
tbl_pessoa_juridica.nome_fantasia, tbl_pessoa_juridica.cnpj,
tbl_endereco.logradouro,tbl_endereco.bairro,tbl_endereco.cidade, tbl_endereco.estado,tbl_endereco.cep, tbl_endereco.complemento,
tbl_endereco_usuario.id_usuario, tbl_endereco_usuario.id_endereco
FROM tbl_usuario
INNER JOIN tbl_pessoa_juridica 
	ON tbl_usuario.id = tbl_pessoa_juridica.id_usuario
INNER JOIN tbl_catador
	ON tbl_usuario.id = tbl_catador.id_usuario
INNER JOIN tbl_endereco_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
INNER JOIN tbl_endereco
	ON tbl_endereco.id = tbl_endereco_usuario.id_endereco
WHERE tbl_catador.id = 1;

# retorna os dados de cadastro de todos os geradores pessoa física
SELECT tbl_gerador.id_usuario, tbl_pessoa_fisica.nome, tbl_pessoa_fisica.cpf, tbl_usuario.email, tbl_usuario.telefone, tbl_pessoa_fisica.data_nascimento, tbl_usuario.senha
FROM tbl_gerador
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_gerador.id_usuario
INNER JOIN tbl_pessoa_fisica
	ON tbl_usuario.id = tbl_pessoa_fisica.id_usuario;
    
# retorna os dados de cadastro de todos os geradores pessoa juridica
SELECT tbl_gerador.id_usuario, tbl_pessoa_juridica.nome_fantasia, tbl_pessoa_juridica.cnpj, tbl_usuario.email, tbl_usuario.telefone, tbl_usuario.senha
FROM tbl_gerador
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_gerador.id_usuario
INNER JOIN tbl_pessoa_juridica
	ON tbl_usuario.id = tbl_pessoa_juridica.id_usuario;
    
# retorna os dados de cadastro de todos os catadores pessoa fisica
SELECT tbl_catador.id_usuario, tbl_pessoa_fisica.nome, tbl_pessoa_fisica.cpf, tbl_usuario.email, tbl_usuario.telefone, tbl_pessoa_fisica.data_nascimento, tbl_usuario.senha
FROM tbl_catador
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_catador.id_usuario
INNER JOIN tbl_pessoa_fisica
	ON tbl_usuario.id = tbl_pessoa_fisica.id_usuario;
     
# retorna os dados de cadastro de todos os catadores pessoa juridica
SELECT tbl_catador.id_usuario, tbl_pessoa_juridica.nome_fantasia, tbl_pessoa_juridica.cnpj, tbl_usuario.email, tbl_usuario.telefone, tbl_usuario.senha
FROM tbl_catador
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_catador.id_usuario
INNER JOIN tbl_pessoa_juridica
	ON tbl_usuario.id = tbl_pessoa_juridica.id_usuario;    

# retorna todos os dados dos geradores    
SELECT tbl_endereco_usuario.id_usuario, tbl_endereco_usuario.id_endereco, 
tbl_usuario.telefone, tbl_usuario.email, tbl_usuario.senha,
tbl_pessoa_fisica.nome, tbl_pessoa_fisica.cpf, tbl_pessoa_fisica.data_nascimento,
tbl_endereco.logradouro,tbl_endereco.bairro,tbl_endereco.cidade, tbl_endereco.estado,tbl_endereco.cep, tbl_endereco.complemento,
tbl_pessoa_juridica.nome_fantasia, tbl_pessoa_juridica.cnpj, tbl_usuario.email, tbl_usuario.telefone, tbl_usuario.senha
FROM tbl_gerador
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_gerador.id_usuario
LEFT JOIN tbl_pessoa_fisica
		ON tbl_usuario.id = tbl_pessoa_fisica.id_usuario
LEFT JOIN tbl_pessoa_juridica
	ON tbl_usuario.id = tbl_pessoa_juridica.id_usuario   
INNER JOIN tbl_endereco_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
INNER JOIN tbl_endereco
	ON tbl_endereco.id = tbl_endereco_usuario.id_endereco;
    
# retorna todos os dados dos catadores    
SELECT tbl_endereco_usuario.id_usuario, tbl_endereco_usuario.id_endereco, 
tbl_usuario.telefone, tbl_usuario.email, tbl_usuario.senha,
tbl_pessoa_fisica.nome, tbl_pessoa_fisica.cpf, tbl_pessoa_fisica.data_nascimento,
tbl_endereco.logradouro,tbl_endereco.bairro,tbl_endereco.cidade, tbl_endereco.estado,tbl_endereco.cep, tbl_endereco.complemento,
tbl_pessoa_juridica.nome_fantasia, tbl_pessoa_juridica.cnpj, tbl_usuario.email, tbl_usuario.telefone, tbl_usuario.senha
FROM tbl_catador
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_catador.id_usuario
LEFT JOIN tbl_pessoa_fisica
		ON tbl_usuario.id = tbl_pessoa_fisica.id_usuario
LEFT JOIN tbl_pessoa_juridica
	ON tbl_usuario.id = tbl_pessoa_juridica.id_usuario   
INNER JOIN tbl_endereco_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
INNER JOIN tbl_endereco
	ON tbl_endereco.id = tbl_endereco_usuario.id_endereco;
    
# geolocalização - lat lng
SELECT tbl_endereco.id, tbl_endereco.latitude, tbl_endereco.longitude, tbl_endereco.logradouro, tbl_endereco.estado, tbl_endereco.cidade, ST_DISTANCE_SPHERE(POINT(-15.7801, -47.9292), POINT(latitude, longitude)) AS distance
FROM tbl_endereco
WHERE ST_DISTANCE_SPHERE(POINT(-23.549294, -46.872740), POINT(latitude, longitude)) <= 10000 
ORDER BY distance
LIMIT 10;    


SELECT tbl_catador.id as id_catador, ST_DISTANCE_SPHERE(POINT(-23.549294, -46.872740), POINT(latitude, longitude)) AS distance
FROM tbl_endereco
INNER JOIN tbl_endereco_usuario
	ON tbl_endereco_usuario.id_endereco = tbl_endereco.id
INNER JOIN tbl_usuario
	ON tbl_usuario.id = tbl_endereco_usuario.id_usuario
LEFT JOIN tbl_pessoa_fisica
	ON tbl_pessoa_fisica.id_usuario = tbl_usuario.id
LEFT JOIN tbl_pessoa_juridica
	ON tbl_pessoa_juridica.id_usuario = tbl_usuario.id
INNER JOIN tbl_catador
	ON tbl_catador.id_usuario = tbl_usuario.id
INNER JOIN tbl_materiais_catador
	ON tbl_catador.id = tbl_materiais_catador.id_catador
INNER JOIN tbl_materiais
	ON tbl_materiais.id = tbl_materiais_catador.id_materiais
WHERE ST_DISTANCE_SPHERE(POINT(-23.549294, -46.872740), POINT(latitude, longitude)) <= 10000 AND id_materiais in (1,2) 
GROUP BY id_catador, longitude, latitude HAVING count(id_catador) >= (SELECT count(*) AS id FROM tbl_materiais WHERE id IN(1,2))
ORDER BY distance
LIMIT 10;




    