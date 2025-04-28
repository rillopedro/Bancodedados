CREATE DATABASE ETECMCM2;

USE ETECMCM2;

CREATE TABLE produtos (
    id_prod INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    preco DECIMAL(10,2),
    marca VARCHAR(255),
    qtde INT,
    fk_categoria_id_categoria INT
);

CREATE TABLE categoria (
    nome_cat VARCHAR(255),
    id_categoria INT PRIMARY KEY  AUTO_INCREMENT
);
 
ALTER TABLE produtos ADD CONSTRAINT FK_produtos_2
    FOREIGN KEY (fk_categoria_id_categoria)
    REFERENCES categoria (id_categoria)
    ON DELETE RESTRICT;