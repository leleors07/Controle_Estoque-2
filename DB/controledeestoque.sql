-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 05-Jun-2019 às 19:52
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `controledeestoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `idfabricante` int(11) NOT NULL,
  `nomefabricante` varchar(75) NOT NULL,
  `CNPJfabricante` varchar(16) NOT NULL,
  `emailfabricante` varchar(75) NOT NULL,
  `telefonefabricante` varchar(16) NOT NULL,
  `usuario_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `fabricante` (`idfabricante`, `nomefabricante`, `CNPJfabricante`, `emailfabricante`, `telefonefabricante`, `usuario_iduser`) VALUES
(1, 'matheus', '0000000000000', 'fb@bg.com', '1444444444', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens`
--

CREATE TABLE `itens` (
  `iditens` int(11) NOT NULL,
  `quantitens` decimal(8,2) NOT NULL,
  `quantitensvend` decimal(8,2) NOT NULL,
  `valcompitens` decimal(8,2) NOT NULL,
  `valvenditens` decimal(8,2) NOT NULL,
  `datacompraitens` date NOT NULL,
  `datavenda` date DEFAULT NULL,
  `ativo` tinyint(4) NOT NULL,
  `produto_codigorefprod` int(11) NOT NULL,
  `fabricante_idfabricante` int(11) NOT NULL,
  `usuario_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigorefprod` int(11) NOT NULL,
  `nomeproduto` varchar(75) NOT NULL,
  `usuario_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `representante`
--

CREATE TABLE `representante` (
  `idrepresentante` int(11) NOT NULL,
  `nomerepresentante` varchar(75) NOT NULL,
  `emailrepresentante` varchar(45) NOT NULL,
  `telefonerepresentante` varchar(16) NOT NULL,
  `fabricante_idfabricante` int(11) NOT NULL,
  `usuario_iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `iduser` int(11) NOT NULL,
  `username` varchar(75) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(75) NOT NULL,
  `dataregistro` date NOT NULL,
  `permissao` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`iduser`, `username`, `email`, `password`, `dataregistro`, `permissao`) VALUES
(1, 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', '2019-05-23', 1),
(2, 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', '2019-05-24', 2),
(3, 'admin', 'admin@admin.com', 'admin', '2019-05-24', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`idfabricante`),
  ADD KEY `fk_fabricante_usuario1_idx` (`usuario_iduser`);

--
-- Indexes for table `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`iditens`),
  ADD KEY `fk_itens_produto1_idx` (`produto_codigorefprod`),
  ADD KEY `fk_itens_fabricante1_idx` (`fabricante_idfabricante`),
  ADD KEY `fk_itens_usuario1_idx` (`usuario_iduser`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigorefprod`),
  ADD KEY `fk_produto_usuario_idx` (`usuario_iduser`);

--
-- Indexes for table `representante`
--
ALTER TABLE `representante`
  ADD PRIMARY KEY (`idrepresentante`),
  ADD KEY `fk_representante_fabricante1_idx` (`fabricante_idfabricante`),
  ADD KEY `fk_representante_usuario1_idx` (`usuario_iduser`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `idfabricante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `itens`
--
ALTER TABLE `itens`
  MODIFY `iditens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `codigorefprod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `representante`
--
ALTER TABLE `representante`
  MODIFY `idrepresentante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD CONSTRAINT `fk_fabricante_usuario1` FOREIGN KEY (`usuario_iduser`) REFERENCES `usuario` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itens`
--
ALTER TABLE `itens`
  ADD CONSTRAINT `fk_itens_fabricante1` FOREIGN KEY (`fabricante_idfabricante`) REFERENCES `fabricante` (`idfabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_produto1` FOREIGN KEY (`produto_codigorefprod`) REFERENCES `produto` (`codigorefprod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itens_usuario1` FOREIGN KEY (`usuario_iduser`) REFERENCES `usuario` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_usuario` FOREIGN KEY (`usuario_iduser`) REFERENCES `usuario` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `fk_representante_fabricante1` FOREIGN KEY (`fabricante_idfabricante`) REFERENCES `fabricante` (`idfabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_representante_usuario1` FOREIGN KEY (`usuario_iduser`) REFERENCES `usuario` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
