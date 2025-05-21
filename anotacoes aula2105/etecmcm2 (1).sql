-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Maio-2025 às 17:45
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `etecmcm2`
--
CREATE DATABASE IF NOT EXISTS `etecmcm2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `etecmcm2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `nome_cat` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`nome_cat`, `id_categoria`) VALUES
('Limpeza', 1),
('Eletronicos', 2),
('Açougue', 3),
('Frios', 4),
('Lacticinios', 5),
('Enlatados', 6),
('Higiene', 7),
('Hortfrut', 8),
('Roupas', 9),
('Chocolates', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_cat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_cat`) VALUES
(1, 'laticinios'),
(2, 'higiene'),
(3, 'limpeza'),
(4, 'hortifruti'),
(5, 'enlatados'),
(7, 'açougue');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_prod` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `qtde` int(11) DEFAULT NULL,
  `fk_categoria_id_categoria` int(11) DEFAULT NULL,
  `unidade_medida` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_prod`, `nome`, `preco`, `marca`, `qtde`, `fk_categoria_id_categoria`, `unidade_medida`) VALUES
(4, 'Sabão em pó', '30.50', 'OMO', 50, 2, NULL),
(5, 'Detergente', '30.50', 'Ypê', 50, 2, NULL),
(7, 'Geladeira', '3000.00', 'Eletrolux', 50, 2, NULL),
(8, 'Microondas', '1400.00', 'Samsung', 50, 2, NULL),
(9, 'Picanha', '30.50', 'Seara', 50, 3, NULL),
(10, 'Costela', '30.50', 'Freeboi', 50, 3, NULL),
(11, 'Maçã', '15.50', 'Gala', 100, 8, 'Kg'),
(12, 'Banana', '12.50', 'Chiquita', 100, 8, 'Kg'),
(13, 'Presuntos', '20.00', 'Sadia', 100, 4, 'Kg'),
(14, 'Queijo', '50.00', 'Sadia', 100, 4, 'Kg'),
(15, 'Iorgute', '16.50', 'Danone', 100, 5, 'un'),
(16, 'Margarina', '10.50', 'Qualy', 100, 5, 'un'),
(17, 'Ervilha', '6.50', 'Quero', 100, 6, 'un'),
(18, 'Ervilha', '6.50', 'Quero', 100, 6, 'un'),
(19, 'Milho', '5.50', 'Quero', 100, 6, 'un');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `FK_produtos_2` (`fk_categoria_id_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `FK_produtos_2` FOREIGN KEY (`fk_categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
