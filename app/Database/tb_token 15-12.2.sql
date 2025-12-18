-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Dez-2025 às 01:24
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tb_token`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome_responsavel` varchar(150) DEFAULT NULL,
  `responsavel_financeiro` varchar(150) DEFAULT NULL,
  `id_prof_referencia` int(10) UNSIGNED DEFAULT NULL,
  `origem` varchar(50) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nome`, `cpf`, `telefone`, `nome_responsavel`, `responsavel_financeiro`, `id_prof_referencia`, `origem`, `data_cadastro`) VALUES
(2, 'TESTE PADRÃO ZAP', '027.235.835-54', '(81) 98888-6656', 'Pai Teste', 'Financeiro Teste', 136, 'Organico', '2025-12-11 18:33:32'),
(3, 'Teste número 2', '978.913.421-23', '(81) 99988-7711', 'respon número 2 ', 'financeiro número 2', 106, 'Marketing', '2025-12-12 14:05:36');

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissionais`
--

CREATE TABLE `profissionais` (
  `id_prof` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `registro` varchar(50) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `porcento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `profissionais`
--

INSERT INTO `profissionais` (`id_prof`, `nome`, `especialidade`, `registro`, `ativo`, `porcento`) VALUES
(100, 'Alexciane Beatriz Vieira Paixão', NULL, NULL, 1, 80),
(102, 'Daniella Paes Barreto Bezerra', NULL, NULL, 1, 70),
(104, 'Talita Pacheco dos Santos', NULL, NULL, 1, 70),
(106, 'Karla Rodrigues', NULL, NULL, 1, 70),
(107, 'Dayane Souza Silva', NULL, NULL, 1, 80),
(108, 'Thaís Leão', NULL, NULL, 1, 80),
(109, 'Luan Henrique da Silva Arruda', NULL, NULL, 1, 70),
(114, 'Tatiane Silva de Moura', NULL, NULL, 1, 70),
(115, 'Jocelma Maria Andrade Marins', NULL, NULL, 1, 70),
(116, 'Giselle Mendonça de Medeiros', NULL, NULL, 1, 70),
(117, 'Iara Cysneiros Silva', NULL, NULL, 1, 80),
(118, 'Andreza Patricia Machado Pontes', NULL, 'CRFa4-11099', 1, 80),
(119, 'Paulo de Tarso Melo', NULL, '0213928', 1, 80),
(120, 'Beatriz Costa Praxedes', NULL, 'CREFITO 1937-6 TO', 1, 70),
(121, 'Ana Cristina Cavalcante Belfort', NULL, 'CRP/02-27328', 1, 70),
(122, 'Adriana Bezerra', NULL, '02/27302', 1, 75),
(124, 'Gabriela Agra', NULL, '02/26670', 1, 70),
(125, 'Stephanny Tavares Ferreira', NULL, '02/25667', 1, 70),
(126, 'Gabriela Grangeiro Dias', NULL, '02/20360', 1, 75),
(127, 'Dalila Dos Reis Gomes', NULL, '02/26111', 1, 70),
(128, 'Vanessa Rodrigues Barbosa', NULL, '02/26563', 1, 70),
(129, 'Rochanne Sonely de Lima Farias', NULL, '02/26032', 1, 80),
(130, 'Monike Maciel Barros Pontes', NULL, '0228888', 1, 70),
(132, 'Pedro Cerqueira Russo', NULL, 'CRM 22086', 1, 92),
(133, 'Aricia Medeiros', NULL, NULL, 0, 80),
(134, 'Amanda Morais Rodrigues', NULL, NULL, 1, 80),
(135, 'Raissa Guerra de Magalhães Melo', NULL, '02/30050', 1, 70),
(136, 'Augusto César Cordeiro Galindo', NULL, '02/22179', 1, 70),
(137, 'Nathália Karla Souza Cavalcanti', NULL, '02/23103', 1, 70),
(138, 'Rodolfo Cunha', NULL, NULL, 1, 70);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id_sessao` int(11) NOT NULL,
  `id_token` int(10) UNSIGNED NOT NULL,
  `data_sessao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `sessoes`
--

INSERT INTO `sessoes` (`id_sessao`, `id_token`, `data_sessao`) VALUES
(1, 1, '2025-12-19'),
(2, 2, '2025-12-15'),
(3, 2, '2025-12-22'),
(4, 3, '2025-12-16'),
(5, 3, '2025-12-23'),
(6, 3, '2025-12-30'),
(7, 4, '2025-12-10'),
(8, 4, '2025-12-17'),
(9, 5, '2025-12-15'),
(10, 5, '2025-12-22'),
(11, 5, '2025-12-29'),
(12, 7, '2025-12-15'),
(13, 7, '2025-12-19'),
(14, 7, '2025-12-26'),
(15, 8, '2025-12-08'),
(16, 8, '2025-12-15'),
(17, 8, '2025-12-22'),
(18, 8, '2025-12-29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tokens`
--

CREATE TABLE `tokens` (
  `id_token` int(10) UNSIGNED NOT NULL,
  `token` varchar(20) DEFAULT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_prof` int(10) UNSIGNED NOT NULL,
  `paciente` varchar(150) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome_resp` varchar(150) DEFAULT NULL,
  `responsavel_f` varchar(150) DEFAULT NULL,
  `origem` varchar(50) DEFAULT NULL,
  `nome_banco` varchar(80) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT 0.00,
  `formapag` varchar(50) DEFAULT NULL,
  `modalidadep` varchar(50) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `statuspag` varchar(20) DEFAULT 'efetuado',
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tokens`
--

INSERT INTO `tokens` (`id_token`, `token`, `id_user`, `id_prof`, `paciente`, `cpf`, `telefone`, `nome_resp`, `responsavel_f`, `origem`, `nome_banco`, `valor`, `formapag`, `modalidadep`, `vencimento`, `statuspag`, `data_cadastro`) VALUES
(1, '425770554037', 3, 100, 'Teste número 2', '978.913.421-23', '(81) 99999-8888', 'respon número 2 ', 'Respon Financ', NULL, 'Itau', 520.00, 'Crédito', NULL, '2025-12-22', 'efetuado', '2025-12-12 14:34:34'),
(2, '690949350717', 3, 136, 'TESTE PADRÃO ZAP', '027.235.835-54', '(81) 98888-6656', 'Pai Teste', 'Financeiro Teste', NULL, 'Itau', 550.00, 'Crédito', NULL, '2025-12-15', 'efetuado', '2025-12-15 17:48:53'),
(3, '404439606240', 3, 107, 'Teste número 2', '978.913.421-23', '(81) 99988-7711', 'respon número 2 ', 'financeiro número 2', NULL, 'Itau', 350.00, 'Crédito', NULL, '2025-12-15', 'efetuado', '2025-12-12 17:49:46'),
(4, '614601436477', 3, 100, 'Teste número 2', '978.913.421-23', '(81) 99988-7711', 'respon número 2 ', 'financeiro número 2', NULL, 'Bradesco', 400.00, 'Crédito', NULL, '2025-12-15', 'efetuado', '2025-12-15 17:55:43'),
(5, '790625440924', 3, 136, 'Teste número 2', '978.913.421-23', '(81) 99988-7711', 'respon número 2 ', 'financeiro número 2', NULL, 'Itau', 500.00, 'Pix', NULL, '2025-12-12', 'efetuado', '2025-12-11 18:19:53'),
(6, '190801236651', 3, 102, 'TESTE PADRÃO ZAP', '027.235.835-54', '(81) 98888-6656', 'Pai Teste', 'Financeiro Teste', NULL, 'Itau', 450.00, 'Pix / Qrcode', NULL, '2025-12-12', 'efetuado', '2025-12-15 18:33:07'),
(7, '196561339615', 3, 136, 'TESTE PADRÃO ZAP', '027.235.835-54', '(81) 98888-6656', 'Pai Teste', NULL, NULL, 'Bradesco', 650.00, NULL, 'Plano Mensal', '2025-12-16', 'efetuado', '2025-12-15 20:51:37'),
(8, '139982499942', 3, 136, 'TESTE PADRÃO ZAP', '027.235.835-54', '(81) 98888-6656', 'Pai Teste', NULL, NULL, 'Itau', 350.00, NULL, 'Proase', '2025-12-16', 'efetuado', '2025-12-15 20:52:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_a`
--

CREATE TABLE `usuarios_a` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` int(11) DEFAULT 1,
  `status` int(11) DEFAULT 1,
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios_a`
--

INSERT INTO `usuarios_a` (`id_user`, `nome`, `email`, `senha`, `nivel`, `status`, `data_cadastro`) VALUES
(1, 'Assista', 'assistacentro@gmail.com', '$2y$10$AVzSTZyQSVuIVgQG5E9/muCuhvQKB8BCfdM5SlPST56YZjIVpZPhO', 2, 1, '2022-10-25 00:00:00'),
(3, 'Bruno Silva', 'brunojsilvasuporte@gmail.com', '$2y$10$yCmqRlvApJKWOysAldubW.KqyEB8HnrkRji9Vb17XvltZbomcRpgC', 3, 1, '2022-11-09 00:00:00'),
(6, 'Cecilia Campos', 'ceciduda1999@gmail.com', '$2y$10$yhsbkh0DW0ba.AgDie9xfe/eLdhBRhy02KoCB6ir4mi0QsWN1kFMe', 2, 1, '2023-08-15 00:00:00'),
(7, 'Paulo de Tarso', 'paulopsimelo@gmail.com', '$2y$10$iCqD6v1sWFs66VPcOldLG./1hOaqaAx0KTdCogReTh3O3W5b0GW4u', 2, 1, '2024-04-12 00:00:00'),
(8, 'Karen Araújo', 'andradekaren94@gmail.com', '$2y$10$rzhq.wjn0L6Kxu4WSeJ4/.mjK6oYV4aP7DTF09kvBOcEhl/sz1Su6', 2, 1, '2024-05-13 00:00:00'),
(9, 'Alexciane Beatriz Vieira Paixão', 'alexcianebeatriz@hotmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(10, 'Daniella Paes Barreto Bezerra', 'daniellapaesbarreto1011@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(11, 'Talita Pacheco dos Santos', 'talitapacheco.psi@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(12, 'Karla Rodrigues', 'karlinharo08@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(13, 'Dayane Souza Silva', 'dayane.souzapsi@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(14, 'Thaís Leão', 'thaispatricia_2008@hotmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(15, 'Luan Henrique da Silva Arruda', 'luanhenriquepe@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(16, 'Tatiane Silva de Moura', 'mouratatiane11@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(17, 'Jocelma Maria Andrade Marins', 'psicojocelmamarins@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(18, 'Giselle Mendonça de Medeiros', 'gisellemdias.psi@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(19, 'Iara Cysneiros Silva', 'iaracysneirospsi@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(20, 'Andreza Patricia Machado Pontes', 'andrezapontesfono@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(22, 'Beatriz Costa Praxedes', 'beatrizpraxedes@hotmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(23, 'Ana Cristina Cavalcante Belfort', 'cristinabelfort.psi@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(24, 'Adriana Bezerra', 'psi.adriana.bezerra@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(25, 'Gabriela Agra', 'gabrielaagra@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(26, 'Stephanny Tavares Ferreira', 'psi.stephannytavares@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(27, 'Gabriela Grangeiro Dias', 'psi.gabrielagrangeiro@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(28, 'Dalila Dos Reis Gomes', 'psicologadalilareis@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(29, 'Vanessa Rodrigues Barbosa', 'vanessa.rbarbosa@outlook.com.br', '', 1, 1, '2025-12-11 18:21:16'),
(30, 'Rochanne Sonely de Lima Farias', 'psirochannesonely@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(31, 'Monike Maciel Barros Pontes', 'psimonikepontes@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(32, 'Pedro Cerqueira Russo', 'pedro.crusso@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(33, 'Amanda Morais Rodrigues', 'amandamoraisnutricionista@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(34, 'Raissa Guerra de Magalhães Melo', 'psi.raissaguerra@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(35, 'Augusto César Cordeiro Galindo', 'psiaugustocordeiro@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(36, 'Nathália Karla Souza Cavalcanti', 'nathaliacavpsicologia@gmail.com', '', 1, 1, '2025-12-11 18:21:16'),
(37, 'Rodolfo Cunha', 'psirodolfocunha@gmail.com', '', 1, 1, '2025-12-11 18:21:16');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_paciente_prof` (`id_prof_referencia`);

--
-- Índices para tabela `profissionais`
--
ALTER TABLE `profissionais`
  ADD PRIMARY KEY (`id_prof`);

--
-- Índices para tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id_sessao`),
  ADD KEY `fk_sessao_token` (`id_token`);

--
-- Índices para tabela `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `idx_token_user` (`id_user`),
  ADD KEY `idx_token_prof` (`id_prof`);

--
-- Índices para tabela `usuarios_a`
--
ALTER TABLE `usuarios_a`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `profissionais`
--
ALTER TABLE `profissionais`
  MODIFY `id_prof` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id_sessao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id_token` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `usuarios_a`
--
ALTER TABLE `usuarios_a`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_paciente_prof` FOREIGN KEY (`id_prof_referencia`) REFERENCES `profissionais` (`id_prof`) ON DELETE SET NULL;

--
-- Limitadores para a tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `fk_sessoes_token` FOREIGN KEY (`id_token`) REFERENCES `tokens` (`id_token`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `fk_tokens_prof` FOREIGN KEY (`id_prof`) REFERENCES `profissionais` (`id_prof`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tokens_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios_a` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
