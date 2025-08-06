-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06-Ago-2025 às 17:40
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
-- Banco de dados: `lava rapido`
--
CREATE DATABASE IF NOT EXISTS `lava rapido` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lava rapido`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id_atendimento` int(11) NOT NULL,
  `totalgeral` decimal(10,2) DEFAULT NULL,
  `dataatend` date DEFAULT NULL,
  `id_car` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_servico`
--

CREATE TABLE `atendimento_servico` (
  `id_ats` int(11) NOT NULL,
  `qtd` int(11) DEFAULT NULL,
  `totalserv` decimal(10,2) DEFAULT NULL,
  `id_codos` int(11) DEFAULT NULL,
  `id_serv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carro`
--

CREATE TABLE `carro` (
  `id_carro` int(11) NOT NULL,
  `placa` int(11) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `id_cli` int(11) DEFAULT NULL,
  `id_mod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `datanasc` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `id_modelo` int(11) NOT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `id_mar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL,
  `servico` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id_atendimento`),
  ADD KEY `id_car` (`id_car`);

--
-- Índices para tabela `atendimento_servico`
--
ALTER TABLE `atendimento_servico`
  ADD PRIMARY KEY (`id_ats`),
  ADD KEY `id_codos` (`id_codos`),
  ADD KEY `id_serv` (`id_serv`);

--
-- Índices para tabela `carro`
--
ALTER TABLE `carro`
  ADD PRIMARY KEY (`id_carro`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `id_cli` (`id_cli`),
  ADD KEY `id_mod` (`id_mod`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `telefone` (`telefone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_end` (`id_end`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id_modelo`),
  ADD KEY `id_mar` (`id_mar`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id_servico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id_atendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atendimento_servico`
--
ALTER TABLE `atendimento_servico`
  MODIFY `id_ats` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carro`
--
ALTER TABLE `carro`
  MODIFY `id_carro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id_modelo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`id_car`) REFERENCES `carro` (`id_carro`);

--
-- Limitadores para a tabela `atendimento_servico`
--
ALTER TABLE `atendimento_servico`
  ADD CONSTRAINT `atendimento_servico_ibfk_1` FOREIGN KEY (`id_codos`) REFERENCES `atendimento` (`id_atendimento`),
  ADD CONSTRAINT `atendimento_servico_ibfk_2` FOREIGN KEY (`id_serv`) REFERENCES `servico` (`id_servico`);

--
-- Limitadores para a tabela `carro`
--
ALTER TABLE `carro`
  ADD CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `carro_ibfk_2` FOREIGN KEY (`id_mod`) REFERENCES `modelo` (`id_modelo`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_end`) REFERENCES `endereco` (`id_endereco`);

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_mar`) REFERENCES `marca` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
