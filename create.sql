CREATE DATABASE db_zerowaste;
USE db_zerowaste;
SHOW TABLES;


CREATE TABLE tbl_usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(256) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    biografia VARCHAR(191),
    UNIQUE INDEX(id)
);

CREATE TABLE tbl_pessoa_fisica(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT FK_usuario_pessoa_fisica
		FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario (id),
    UNIQUE INDEX(id)    
);

CREATE TABLE tbl_pessoa_juridica(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    id_usuario INT NOT NULL,
	CONSTRAINT FK_usuario_pessoa_juridica
		FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id),
    UNIQUE INDEX(id)
);

CREATE TABLE tbl_catador(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    CONSTRAINT FK_usuario_catador
		FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id),
	UNIQUE INDEX(id)
);

CREATE TABLE tbl_gerador(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    CONSTRAINT FK_usuario_gerador
		FOREIGN KEY (id_usuario)
        REFERENCES tbl_usuario(id),
	UNIQUE INDEX(id)
);

CREATE TABLE tbl_endereco(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(45) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    complemento VARCHAR(45),
    apelido VARCHAR(30),
    numero VARCHAR(8),
    UNIQUE INDEX(id)
);

CREATE TABLE tbl_usuario_endereco(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_endereco INT NOT NULL,
    CONSTRAINT FK_usuario_usuario_endereco
		FOREIGN KEY(id_usuario)
        REFERENCES tbl_usuario(id),
	CONSTRAINT FK_endereco_usuario_endereco
		FOREIGN KEY (id_endereco)
        REFERENCES tbl_endereco(id),
	UNIQUE INDEX(id)
);

CREATE TABLE tbl_materiais(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    UNIQUE INDEX(id)
);

CREATE TABLE tbl_materiais_catador(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_materiais INT NOT NULL,
    id_catador INT NOT NULL,
    CONSTRAINT FK_materiais_materiais_catador
		FOREIGN KEY (id_materiais)
        REFERENCES tbl_materiais(id),
	CONSTRAINT FK_catador_materiais_catador
		FOREIGN KEY (id_catador)
        REFERENCES tbl_catador(id),
	UNIQUE INDEX(id)
);

CREATE TABLE tbl_pedido(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    
);

CREATE TABLE tbl_pedido_catador(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    distancia FLOAT NOT NULL,
    id_pedido INT NOT NULL,
    id_catador INT NOT NULL,
    CONSTRAINT FK_pedido_pedido_catador
		FOREIGN KEY(id_pedido)
        REFERENCES tbl_pedido(id),
    CONSTRAINT FK_catador_pedido_catador
		FOREIGN KEY (id_catador)
        REFERENCES tbl_catador(id),
	UNIQUE INDEX(id)      
);

