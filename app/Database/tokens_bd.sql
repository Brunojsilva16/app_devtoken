-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 18/12/2025 às 19:51
-- Versão do servidor: 8.0.44-cll-lve
-- Versão do PHP: 8.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica2_tokens`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nome_responsavel` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `responsavel_financeiro` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_prof_referencia` int UNSIGNED DEFAULT NULL,
  `origem` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `nome`, `cpf`, `telefone`, `nome_responsavel`, `responsavel_financeiro`, `id_prof_referencia`, `origem`, `data_cadastro`) VALUES
(34, 'Ana Clara Souza', '111.222.333-44', '(11) 99999-1001', 'Ana Clara Souza', 'Ana Clara Souza', NULL, 'Organico', '2025-12-01 09:00:00'),
(35, 'Bruno Ferreira', '222.333.444-55', '(11) 99999-1002', 'Carla Ferreira', 'Carla Ferreira', NULL, 'Marketing', '2025-12-01 10:30:00'),
(36, 'Carlos Eduardo', '333.444.555-66', '(11) 99999-1003', 'Carlos Eduardo', 'Carlos Eduardo', NULL, 'Organico', '2025-12-02 11:00:00'),
(37, 'Daniela Oliveira', '444.555.666-77', '(11) 99999-1004', 'Daniela Oliveira', 'Daniela Oliveira', NULL, 'Organico', '2025-12-02 14:00:00'),
(38, 'Eduardo Santos', '555.666.777-88', '(11) 99999-1005', 'Maria Santos', 'Maria Santos', NULL, 'Marketing', '2025-12-03 09:30:00'),
(39, 'Fernanda Lima', '666.777.888-99', '(11) 99999-1006', 'Fernanda Lima', 'Fernanda Lima', NULL, 'Organico', '2025-12-03 16:00:00'),
(40, 'Gabriel Costa', '777.888.999-00', '(11) 99999-1007', 'Gabriel Costa', 'Gabriel Costa', NULL, 'Marketing', '2025-12-04 10:00:00'),
(41, 'Helena Martins', '888.999.000-11', '(11) 99999-1008', 'João Martins', 'João Martins', NULL, 'Marketing', '2025-12-04 13:30:00'),
(42, 'Igor Pereira', '999.000.111-22', '(11) 99999-1009', 'Igor Pereira', 'Igor Pereira', NULL, 'Organico', '2025-12-05 08:00:00'),
(43, 'Julia Rocha', '000.111.222-33', '(11) 99999-1010', 'Julia Rocha', 'Julia Rocha', NULL, 'Marketing', '2025-12-05 15:00:00'),
(44, 'Kaique Alves', '123.123.123-12', '(11) 99999-1011', 'Kaique Alves', 'Kaique Alves', NULL, 'Organico', '2025-12-06 09:00:00'),
(45, 'Larissa Mendes', '234.234.234-23', '(11) 99999-1012', 'Larissa Mendes', 'Larissa Mendes', NULL, 'Organico', '2025-12-06 11:00:00'),
(46, 'Matheus Nunes', '345.345.345-34', '(11) 99999-1013', 'Sonia Nunes', 'Sonia Nunes', NULL, 'Marketing', '2025-12-08 14:00:00'),
(47, 'Natalia Ribeiro', '456.456.456-45', '(11) 99999-1014', 'Natalia Ribeiro', 'Natalia Ribeiro', NULL, 'Organico', '2025-12-08 16:30:00'),
(48, 'Otavio Barbosa', '567.567.567-56', '(11) 99999-1015', 'Otavio Barbosa', 'Otavio Barbosa', NULL, 'Marketing', '2025-12-09 10:00:00'),
(49, 'Paula Castro', '678.678.678-67', '(11) 99999-1016', 'Paula Castro', 'Paula Castro', NULL, 'Marketing', '2025-12-09 13:00:00'),
(50, 'Quintino Dias', '789.789.789-78', '(11) 99999-1017', 'Quintino Dias', 'Quintino Dias', NULL, 'Organico', '2025-12-10 09:30:00'),
(51, 'Rafaela Pinto', '890.890.890-89', '(11) 99999-1018', 'Rafaela Pinto', 'Rafaela Pinto', NULL, 'Marketing', '2025-12-10 15:30:00'),
(52, 'Samuel Vieira', '901.901.901-90', '(11) 99999-1019', 'Roberto Vieira', 'Roberto Vieira', NULL, 'Marketing', '2025-12-11 11:00:00'),
(53, 'Tatiana Carvalho', '012.012.012-01', '(11) 99999-1020', 'Tatiana Carvalho', 'Tatiana Carvalho', NULL, 'Organico', '2025-12-11 14:30:00'),
(54, 'Ubirajara Gomes', '123.321.123-32', '(11) 99999-1021', 'Ubirajara Gomes', 'Ubirajara Gomes', NULL, 'Organico', '2025-12-12 08:30:00'),
(55, 'Valentina Azevedo', '234.432.234-43', '(11) 99999-1022', 'Valentina Azevedo', 'Valentina Azevedo', NULL, 'Organico', '2025-12-12 10:30:00'),
(56, 'Wagner Moura', '345.543.345-54', '(11) 99999-1023', 'Wagner Moura', 'Wagner Moura', NULL, 'Marketing', '2025-12-13 13:00:00'),
(57, 'Xuxa Meneghel', '456.654.456-65', '(11) 99999-1024', 'Marlene Mattos', 'Marlene Mattos', NULL, 'Organico', '2025-12-13 16:00:00'),
(58, 'Yuri Alberto', '567.765.567-76', '(11) 99999-1025', 'Yuri Alberto', 'Yuri Alberto', NULL, 'Marketing', '2025-12-15 09:00:00'),
(59, 'Zelia Duncan', '678.876.678-87', '(11) 99999-1026', 'Zelia Duncan', 'Zelia Duncan', NULL, 'Organico', '2025-12-15 11:30:00'),
(60, 'Amanda Nunes', '789.987.789-98', '(11) 99999-1027', 'Amanda Nunes', 'Amanda Nunes', NULL, 'Organico', '2025-12-16 14:00:00'),
(61, 'Bernardo Silva', '890.098.890-09', '(11) 99999-1028', 'Carlos Silva', 'Carlos Silva', NULL, 'Marketing', '2025-12-16 16:30:00'),
(62, 'Cecilia Meireles', '901.109.901-10', '(11) 99999-1029', 'Cecilia Meireles', 'Cecilia Meireles', NULL, 'Organico', '2025-12-17 10:00:00'),
(63, 'Diogo Nogueira', '012.210.012-21', '(11) 99999-1030', 'Diogo Nogueira', 'Diogo Nogueira', NULL, 'Organico', '2025-12-17 15:00:00'),
(64, 'Gabriella Soares Mendes da Silva', '144.519.414-74', '(81) 98992-1361', 'Lillian Batista Soares', '', 100, 'Organico', '2025-12-18 12:19:08'),
(65, 'PAULO TESTE', '047.501.154-60', '(88) 99999-9999', 'zé', 'zé Maria', 119, 'Organico', '2025-12-18 13:22:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissionais`
--

CREATE TABLE `profissionais` (
  `id_prof` int UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `especialidade` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registro` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `porcento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `profissionais`
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
-- Estrutura para tabela `sessoes`
--

CREATE TABLE `sessoes` (
  `id_sessao` int NOT NULL,
  `id_token` int UNSIGNED NOT NULL,
  `data_sessao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessoes`
--

INSERT INTO `sessoes` (`id_sessao`, `id_token`, `data_sessao`) VALUES
(17, 9, '2025-11-06'),
(18, 9, '2025-11-13'),
(19, 10, '2025-11-10'),
(20, 11, '2025-11-13'),
(21, 11, '2025-11-20'),
(22, 11, '2025-11-27'),
(23, 12, '2025-11-16'),
(24, 13, '2025-11-19'),
(25, 13, '2025-11-26'),
(26, 14, '2025-11-22'),
(27, 15, '2025-11-24'),
(28, 15, '2025-12-01'),
(29, 15, '2025-12-08'),
(30, 15, '2025-12-15'),
(31, 16, '2025-11-26'),
(32, 16, '2025-12-03'),
(33, 17, '2025-11-29'),
(34, 18, '2025-12-02'),
(35, 18, '2025-12-09'),
(36, 24, '2025-12-08'),
(37, 25, '2025-12-08'),
(38, 25, '2025-12-15'),
(39, 25, '2025-12-22'),
(40, 25, '2025-12-29'),
(41, 26, '2025-12-10'),
(42, 26, '2025-12-17'),
(43, 27, '2025-12-10'),
(44, 28, '2025-12-12'),
(45, 28, '2025-12-19'),
(46, 29, '2025-12-12'),
(47, 30, '2025-12-12'),
(48, 31, '2025-12-13'),
(49, 32, '2025-12-13'),
(50, 33, '2025-12-14'),
(51, 34, '2025-12-14'),
(52, 35, '2025-12-15'),
(53, 36, '2025-12-15'),
(54, 37, '2025-12-16'),
(55, 38, '2025-12-16'),
(56, 39, '2025-12-17'),
(57, 40, '2025-12-17'),
(58, 41, '2025-12-18'),
(59, 42, '2025-12-18'),
(60, 43, '2025-12-19'),
(61, 44, '2025-12-19'),
(62, 45, '2025-12-20'),
(63, 46, '2025-12-20'),
(64, 47, '2025-12-21'),
(65, 48, '2025-12-21'),
(66, 49, '2025-12-22'),
(67, 50, '2025-12-22'),
(68, 51, '2025-12-23'),
(69, 52, '2025-12-23'),
(70, 53, '2025-12-24'),
(71, 54, '2025-12-24'),
(72, 55, '2025-12-25'),
(73, 56, '2025-12-25'),
(74, 57, '2025-12-26'),
(75, 58, '2025-12-26'),
(77, 30, '2025-12-19'),
(78, 32, '2025-12-20'),
(79, 34, '2025-12-21'),
(80, 36, '2025-12-22'),
(81, 38, '2025-12-23'),
(82, 40, '2025-12-24'),
(83, 42, '2025-12-25'),
(84, 44, '2025-12-26'),
(85, 46, '2025-12-27'),
(86, 48, '2025-12-28'),
(87, 50, '2025-12-29'),
(88, 52, '2025-12-30'),
(89, 54, '2025-12-31'),
(90, 56, '2026-01-01'),
(91, 58, '2026-01-02'),
(92, 59, '2025-11-06'),
(93, 59, '2025-11-13'),
(94, 60, '2025-11-10'),
(95, 61, '2025-11-13'),
(96, 61, '2025-11-20'),
(97, 62, '2025-11-16'),
(98, 63, '2025-11-19'),
(99, 64, '2025-11-21'),
(100, 65, '2025-11-24'),
(101, 65, '2025-12-01'),
(102, 66, '2025-11-26'),
(103, 67, '2025-11-29'),
(104, 68, '2025-12-02'),
(105, 19, '2025-12-02'),
(106, 69, '2025-12-02'),
(107, 70, '2025-12-03'),
(108, 71, '2025-12-04'),
(109, 72, '2025-12-05'),
(110, 73, '2025-12-06'),
(111, 74, '2025-12-07'),
(112, 75, '2025-12-08'),
(113, 76, '2025-12-09'),
(114, 77, '2025-12-10'),
(115, 78, '2025-12-11'),
(116, 79, '2025-12-12'),
(117, 80, '2025-12-12'),
(118, 81, '2025-12-13'),
(119, 82, '2025-12-13'),
(120, 83, '2025-12-14'),
(121, 84, '2025-12-14'),
(122, 85, '2025-12-15'),
(123, 86, '2025-12-15'),
(124, 87, '2025-12-16'),
(125, 88, '2025-12-16'),
(126, 89, '2025-12-17'),
(127, 90, '2025-12-17'),
(128, 91, '2025-12-18'),
(129, 92, '2025-12-18'),
(130, 93, '2025-12-19'),
(131, 94, '2025-12-19'),
(132, 95, '2025-12-20'),
(133, 96, '2025-12-20'),
(134, 97, '2025-12-21'),
(135, 98, '2025-12-21'),
(136, 99, '2025-12-22'),
(137, 100, '2025-12-22'),
(138, 101, '2025-12-23'),
(139, 102, '2025-12-23'),
(140, 103, '2025-12-24'),
(141, 104, '2025-12-24'),
(142, 105, '2025-12-25'),
(143, 106, '2025-12-25'),
(144, 107, '2025-12-26'),
(145, 108, '2025-12-26'),
(168, 70, '2025-12-10'),
(169, 72, '2025-12-12'),
(170, 74, '2025-12-14'),
(171, 76, '2025-12-16'),
(172, 78, '2025-12-18'),
(173, 80, '2025-12-19'),
(174, 82, '2025-12-20'),
(175, 84, '2025-12-21'),
(176, 86, '2025-12-22'),
(177, 88, '2025-12-23'),
(178, 90, '2025-12-24'),
(179, 92, '2025-12-25'),
(180, 94, '2025-12-26'),
(181, 96, '2025-12-27'),
(182, 98, '2025-12-28'),
(183, 100, '2025-12-29'),
(184, 102, '2025-12-30'),
(185, 104, '2025-12-31'),
(186, 106, '2026-01-01'),
(187, 108, '2026-01-02'),
(199, 109, '2025-12-10'),
(200, 109, '2025-12-17'),
(201, 109, '2025-12-30'),
(202, 110, '2025-12-18'),
(203, 110, '2025-12-24'),
(204, 110, '2025-12-31'),
(205, 110, '2026-01-07'),
(206, 111, '2025-12-12'),
(207, 111, '2025-12-19'),
(208, 111, '2025-12-26'),
(209, 112, '2025-12-04'),
(210, 112, '2025-12-11'),
(211, 112, '2025-12-19'),
(212, 113, '2025-12-18'),
(213, 113, '2025-12-25'),
(214, 113, '2026-01-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tokens`
--

CREATE TABLE `tokens` (
  `id_token` int UNSIGNED NOT NULL,
  `token` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_user` int UNSIGNED NOT NULL,
  `id_prof` int UNSIGNED NOT NULL,
  `paciente` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cpf` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nome_resp` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `responsavel_f` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `origem` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nome_banco` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `formapag` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modalidadep` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `statuspag` varchar(20) COLLATE utf8mb4_general_ci DEFAULT 'efetuado',
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tokens`
--

INSERT INTO `tokens` (`id_token`, `token`, `id_user`, `id_prof`, `paciente`, `cpf`, `telefone`, `nome_resp`, `responsavel_f`, `origem`, `nome_banco`, `valor`, `formapag`, `modalidadep`, `vencimento`, `statuspag`, `data_cadastro`) VALUES
(9, '123456789011', 3, 100, 'Paciente Teste Nov 1', '111.222.333-44', '(81) 98888-1111', 'Mãe Teste 1', 'Pai Teste 1', 'Organico', 'Itau', 250.00, 'Pix', 'Avaliação T', '2025-11-05', 'efetuado', '2025-11-05 10:00:00'),
(10, '123456789012', 3, 102, 'Paciente Teste Nov 2', '222.333.444-55', '(81) 98888-2222', NULL, NULL, 'Marketing', 'Bradesco', 300.00, 'Crédito', 'Avaliação F', '2025-11-08', 'efetuado', '2025-11-08 14:30:00'),
(11, '123456789013', 3, 136, 'Paciente Teste Nov 3', '333.444.555-66', '(81) 98888-3333', 'Responsavel 3', 'Financeiro 3', 'Organico', 'Itau', 500.00, 'Débito', 'Plano Mensal', '2025-11-12', 'efetuado', '2025-11-12 09:15:00'),
(12, '123456789014', 3, 138, 'Paciente Teste Nov 4', '444.555.666-77', '(81) 98888-4444', NULL, NULL, 'Marketing', 'Itau', 150.00, 'Pix', 'Consulta Nutrição', '2025-11-15', 'efetuado', '2025-11-15 11:00:00'),
(13, '123456789015', 3, 100, 'Paciente Teste Nov 5', '555.666.777-88', '(81) 98888-5555', 'Mãe 5', 'Pai 5', 'Organico', 'Bradesco', 450.00, 'Espécie', 'Avaliação N', '2025-11-18', 'efetuado', '2025-11-18 16:45:00'),
(14, '123456789016', 3, 102, 'Paciente Teste Nov 6', '666.777.888-99', '(81) 98888-6666', NULL, NULL, 'Marketing', 'Itau', 200.00, 'Pix / Qrcode', 'Visita E', '2025-11-20', 'efetuado', '2025-11-20 08:30:00'),
(15, '123456789017', 3, 136, 'Paciente Teste Nov 7', '777.888.999-00', '(81) 98888-7777', 'Resp 7', 'Fin 7', 'Organico', 'Bradesco', 600.00, 'Crédito', 'Plano Mensal', '2025-11-22', 'efetuado', '2025-11-22 13:00:00'),
(16, '123456789018', 3, 138, 'Paciente Teste Nov 8', '888.999.000-11', '(81) 98888-8888', NULL, NULL, 'Marketing', 'Itau', 350.00, 'Débito', 'Avaliação T', '2025-11-25', 'efetuado', '2025-11-25 15:20:00'),
(17, '123456789019', 3, 100, 'Paciente Teste Nov 9', '999.000.111-22', '(81) 98888-9999', 'Mãe 9', 'Pai 9', 'Organico', 'Itau', 120.00, 'Pix', 'Consulta Psiquiatra', '2025-11-28', 'efetuado', '2025-11-28 09:00:00'),
(18, '123456789010', 3, 102, 'Paciente Teste Nov 10', '000.111.222-33', '(81) 98888-0000', NULL, NULL, 'Marketing', 'Bradesco', 400.00, 'Espécie', 'Proase', '2025-11-30', 'efetuado', '2025-11-30 14:00:00'),
(19, '202512010001', 3, 136, 'Ana Silva Dez 1', '123.456.789-01', '(81) 99999-0001', 'Mãe Ana', 'Pai Ana', 'Organico', 'Itau', 300.00, 'Pix', 'Avaliação T', '2025-12-01', 'efetuado', '2025-12-01 08:00:00'),
(20, '202512020002', 3, 138, 'Bruno Costa Dez 2', '234.567.890-12', '(81) 99999-0002', NULL, NULL, 'Marketing', 'Bradesco', 250.00, 'Crédito', 'Avaliação F', '2025-12-02', 'efetuado', '2025-12-02 09:30:00'),
(21, '202512030003', 3, 100, 'Carlos Souza Dez 3', '345.678.901-23', '(81) 99999-0003', 'Resp Carlos', 'Fin Carlos', 'Organico', 'Itau', 500.00, 'Débito', 'Plano Mensal', '2025-12-03', 'efetuado', '2025-12-03 10:45:00'),
(22, '202512040004', 3, 102, 'Daniela Lima Dez 4', '456.789.012-34', '(81) 99999-0004', NULL, NULL, 'Marketing', 'Itau', 150.00, 'Pix', 'Consulta Nutrição', '2025-12-04', 'efetuado', '2025-12-04 11:15:00'),
(23, '202512050005', 3, 136, 'Eduardo Gomes Dez 5', '567.890.123-45', '(81) 99999-0005', 'Mãe Edu', 'Pai Edu', 'Organico', 'Bradesco', 400.00, 'Espécie', 'Avaliação N', '2025-12-05', 'efetuado', '2025-12-05 13:00:00'),
(24, '202512060006', 3, 138, 'Fernanda Alves Dez 6', '678.901.234-56', '(81) 99999-0006', NULL, NULL, 'Marketing', 'Itau', 200.00, 'Pix / Qrcode', 'Visita E', '2025-12-06', 'efetuado', '2025-12-06 14:20:00'),
(25, '202512070007', 3, 100, 'Gabriel Martins Dez 7', '789.012.345-67', '(81) 99999-0007', 'Resp Gab', 'Fin Gab', 'Organico', 'Bradesco', 600.00, 'Crédito', 'Plano Mensal', '2025-12-07', 'efetuado', '2025-12-07 15:40:00'),
(26, '202512080008', 3, 102, 'Helena Rocha Dez 8', '890.123.456-78', '(81) 99999-0008', NULL, NULL, 'Marketing', 'Itau', 350.00, 'Débito', 'Avaliação T', '2025-12-08', 'efetuado', '2025-12-08 16:50:00'),
(27, '202512090009', 3, 136, 'Igor Santos Dez 9', '901.234.567-89', '(81) 99999-0009', 'Mãe Igor', 'Pai Igor', 'Organico', 'Itau', 120.00, 'Pix', 'Consulta Psiquiatra', '2025-12-09', 'efetuado', '2025-12-09 09:00:00'),
(28, '202512100010', 3, 138, 'Julia Pereira Dez 10', '012.345.678-90', '(81) 99999-0010', NULL, NULL, 'Marketing', 'Bradesco', 400.00, 'Espécie', 'Proase', '2025-12-10', 'efetuado', '2025-12-10 10:30:00'),
(29, '202512110011', 3, 100, 'Lucas Oliveira', '111.111.111-11', '(81) 99999-1111', 'Resp Lucas', 'Fin Lucas', 'Organico', 'Itau', 280.00, 'Pix', 'Avaliação T', '2025-12-11', 'efetuado', '2025-12-11 08:15:00'),
(30, '202512110012', 3, 102, 'Mariana Costa', '222.222.222-22', '(81) 99999-2222', NULL, NULL, 'Marketing', 'Bradesco', 320.00, 'Crédito', 'Avaliação F', '2025-12-11', 'efetuado', '2025-12-11 09:45:00'),
(31, '202512120013', 3, 136, 'Nicolas Ferreira', '333.333.333-33', '(81) 99999-3333', 'Mãe Nic', 'Pai Nic', 'Organico', 'Itau', 550.00, 'Débito', 'Plano Mensal', '2025-12-12', 'efetuado', '2025-12-12 11:00:00'),
(32, '202512120014', 3, 138, 'Olivia Santos', '444.444.444-44', '(81) 99999-4444', NULL, NULL, 'Marketing', 'Itau', 180.00, 'Pix', 'Consulta Nutrição', '2025-12-12', 'efetuado', '2025-12-12 13:30:00'),
(33, '202512130015', 3, 100, 'Pedro Henrique', '555.555.555-55', '(81) 99999-5555', 'Resp Pedro', 'Fin Pedro', 'Organico', 'Bradesco', 420.00, 'Espécie', 'Avaliação N', '2025-12-13', 'efetuado', '2025-12-13 14:45:00'),
(34, '202512130016', 3, 102, 'Quiteria Silva', '666.666.666-66', '(81) 99999-6666', NULL, NULL, 'Marketing', 'Itau', 220.00, 'Pix / Qrcode', 'Visita E', '2025-12-13', 'efetuado', '2025-12-13 16:00:00'),
(35, '202512140017', 3, 136, 'Rafael Souza', '777.777.777-77', '(81) 99999-7777', 'Mãe Rafa', 'Pai Rafa', 'Organico', 'Bradesco', 650.00, 'Crédito', 'Plano Mensal', '2025-12-14', 'efetuado', '2025-12-14 08:30:00'),
(36, '202512140018', 3, 138, 'Sarah Lima', '888.888.888-88', '(81) 99999-8888', NULL, NULL, 'Marketing', 'Itau', 380.00, 'Débito', 'Avaliação T', '2025-12-14', 'efetuado', '2025-12-14 10:00:00'),
(37, '202512150019', 3, 100, 'Thiago Gomes', '999.999.999-99', '(81) 99999-9999', 'Resp Thiago', 'Fin Thiago', 'Organico', 'Itau', 130.00, 'Pix', 'Consulta Psiquiatra', '2025-12-15', 'efetuado', '2025-12-15 11:30:00'),
(38, '202512150020', 3, 102, 'Ursula Alves', '000.000.000-00', '(81) 99999-0000', NULL, NULL, 'Marketing', 'Bradesco', 450.00, 'Espécie', 'Proase', '2025-12-15', 'efetuado', '2025-12-15 13:00:00'),
(39, '202512160021', 3, 136, 'Victor Martins', '121.212.121-21', '(81) 98888-1212', 'Mãe Victor', 'Pai Victor', 'Organico', 'Itau', 300.00, 'Pix', 'Avaliação T', '2025-12-16', 'efetuado', '2025-12-16 14:15:00'),
(40, '202512160022', 3, 138, 'Wagner Rocha', '232.323.232-32', '(81) 98888-2323', NULL, NULL, 'Marketing', 'Bradesco', 250.00, 'Crédito', 'Avaliação F', '2025-12-16', 'efetuado', '2025-12-16 15:30:00'),
(41, '202512170023', 3, 100, 'Xuxa Meneghel', '343.434.343-43', '(81) 98888-3434', 'Resp Xuxa', 'Fin Xuxa', 'Organico', 'Itau', 500.00, 'Débito', 'Plano Mensal', '2025-12-17', 'efetuado', '2025-12-17 09:00:00'),
(42, '202512170024', 3, 102, 'Yasmin Brunet', '454.545.454-54', '(81) 98888-4545', NULL, NULL, 'Marketing', 'Itau', 150.00, 'Pix', 'Consulta Nutrição', '2025-12-17', 'efetuado', '2025-12-17 10:30:00'),
(43, '202512180025', 3, 136, 'Zeca Pagodinho', '565.656.565-65', '(81) 98888-5656', 'Mãe Zeca', 'Pai Zeca', 'Organico', 'Bradesco', 400.00, 'Espécie', 'Avaliação N', '2025-12-18', 'efetuado', '2025-12-18 13:00:00'),
(44, '202512180026', 3, 138, 'Ana Clara', '676.767.676-76', '(81) 98888-6767', NULL, NULL, 'Marketing', 'Itau', 200.00, 'Pix / Qrcode', 'Visita E', '2025-12-18', 'efetuado', '2025-12-18 14:30:00'),
(45, '202512190027', 3, 100, 'Bia Haddad', '787.878.787-87', '(81) 98888-7878', 'Resp Bia', 'Fin Bia', 'Organico', 'Bradesco', 600.00, 'Crédito', 'Plano Mensal', '2025-12-19', 'efetuado', '2025-12-19 16:00:00'),
(46, '202512190028', 3, 102, 'Caio Castro', '898.989.989-98', '(81) 98888-8989', NULL, NULL, 'Marketing', 'Itau', 350.00, 'Débito', 'Avaliação T', '2025-12-19', 'efetuado', '2025-12-19 08:30:00'),
(47, '202512200029', 3, 136, 'Dado Dolabella', '909.090.909-09', '(81) 98888-9090', 'Mãe Dado', 'Pai Dado', 'Organico', 'Itau', 120.00, 'Pix', 'Consulta Psiquiatra', '2025-12-20', 'efetuado', '2025-12-20 10:00:00'),
(48, '202512200030', 3, 138, 'Eliana Michaelichen', '010.101.010-10', '(81) 98888-0101', NULL, NULL, 'Marketing', 'Bradesco', 400.00, 'Espécie', 'Proase', '2025-12-20', 'efetuado', '2025-12-20 11:30:00'),
(49, '202512210031', 3, 100, 'Fabio Porchat', '121.212.121-12', '(81) 97777-1212', 'Resp Fabio', 'Fin Fabio', 'Organico', 'Itau', 280.00, 'Pix', 'Avaliação T', '2025-12-21', 'efetuado', '2025-12-21 13:00:00'),
(50, '202512210032', 3, 102, 'Gisele Bundchen', '232.323.232-23', '(81) 97777-2323', NULL, NULL, 'Marketing', 'Bradesco', 320.00, 'Crédito', 'Avaliação F', '2025-12-21', 'efetuado', '2025-12-21 14:45:00'),
(51, '202512220033', 3, 136, 'Humberto Martins', '343.434.343-34', '(81) 97777-3434', 'Mãe Humberto', 'Pai Humberto', 'Organico', 'Itau', 550.00, 'Débito', 'Plano Mensal', '2025-12-22', 'efetuado', '2025-12-22 16:15:00'),
(52, '202512220034', 3, 138, 'Ivete Sangalo', '454.545.454-45', '(81) 97777-4545', NULL, NULL, 'Marketing', 'Itau', 180.00, 'Pix', 'Consulta Nutrição', '2025-12-22', 'efetuado', '2025-12-22 09:00:00'),
(53, '202512230035', 3, 100, 'Jojo Todynho', '565.656.565-56', '(81) 97777-5656', 'Resp Jojo', 'Fin Jojo', 'Organico', 'Bradesco', 420.00, 'Espécie', 'Avaliação N', '2025-12-23', 'efetuado', '2025-12-23 10:30:00'),
(54, '202512230036', 3, 102, 'Kevinho', '676.767.676-67', '(81) 97777-6767', NULL, NULL, 'Marketing', 'Itau', 220.00, 'Pix / Qrcode', 'Visita E', '2025-12-23', 'efetuado', '2025-12-23 13:00:00'),
(55, '202512240037', 3, 136, 'Luan Santana', '787.878.787-78', '(81) 97777-7878', 'Mãe Luan', 'Pai Luan', 'Organico', 'Bradesco', 650.00, 'Crédito', 'Plano Mensal', '2025-12-24', 'efetuado', '2025-12-24 14:15:00'),
(56, '202512240038', 3, 138, 'Marilia Mendonca', '898.989.989-89', '(81) 97777-8989', NULL, NULL, 'Marketing', 'Itau', 380.00, 'Débito', 'Avaliação T', '2025-12-24', 'efetuado', '2025-12-24 15:30:00'),
(57, '202512250039', 3, 100, 'Neymar Jr', '909.090.909-90', '(81) 97777-9090', 'Resp Neymar', 'Fin Neymar', 'Organico', 'Itau', 130.00, 'Pix', 'Consulta Psiquiatra', '2025-12-25', 'efetuado', '2025-12-25 08:30:00'),
(58, '202512250040', 3, 102, 'Otaviano Costa', '010.101.010-01', '(81) 97777-0101', NULL, NULL, 'Marketing', 'Bradesco', 450.00, 'Espécie', 'Proase', '2025-12-25', 'efetuado', '2025-12-16 10:00:00'),
(59, '111111111111', 1, 120, 'Paciente Nov 01', '111.222.333-01', '(81) 98888-0001', 'Mãe 1', NULL, 'Organico', 'Itau', 250.00, 'Pix', 'Avaliação T', '2025-11-05', 'efetuado', '2025-11-05 09:00:00'),
(60, '111111111112', 1, 115, 'Paciente Nov 02', '222.333.444-02', '(81) 98888-0002', NULL, NULL, 'Marketing', 'Bradesco', 300.00, 'Crédito', 'Avaliação F', '2025-11-08', 'efetuado', '2025-11-08 14:00:00'),
(61, '111111111113', 1, 125, 'Paciente Nov 03', '333.444.555-03', '(81) 98888-0003', 'Resp 3', 'Fin 3', 'Organico', 'Itau', 500.00, 'Débito', 'Plano Mensal', '2025-11-12', 'efetuado', '2025-11-12 10:00:00'),
(62, '111111111114', 1, 114, 'Paciente Nov 04', '444.555.666-04', '(81) 98888-0004', NULL, NULL, 'Marketing', 'Itau', 150.00, 'Pix', 'Consulta Nutrição', '2025-11-15', 'efetuado', '2025-11-15 11:00:00'),
(63, '111111111115', 1, 121, 'Paciente Nov 05', '555.666.777-05', '(81) 98888-0005', 'Mãe 5', NULL, 'Organico', 'Bradesco', 450.00, 'Espécie', 'Avaliação N', '2025-11-18', 'efetuado', '2025-11-18 16:00:00'),
(64, '111111111116', 1, 114, 'Paciente Nov 06', '666.777.888-06', '(81) 98888-0006', NULL, NULL, 'Marketing', 'Itau', 200.00, 'Pix / Qrcode', 'Visita E', '2025-11-20', 'efetuado', '2025-11-20 08:30:00'),
(65, '111111111117', 1, 119, 'Paciente Nov 07', '777.888.999-07', '(81) 98888-0007', 'Resp 7', 'Fin 7', 'Organico', 'Bradesco', 600.00, 'Crédito', 'Plano Mensal', '2025-11-22', 'efetuado', '2025-11-22 13:00:00'),
(66, '111111111118', 1, 102, 'Paciente Nov 08', '888.999.000-08', '(81) 98888-0008', NULL, NULL, 'Marketing', 'Itau', 350.00, 'Débito', 'Avaliação T', '2025-11-25', 'efetuado', '2025-11-25 15:00:00'),
(67, '111111111119', 1, 125, 'Paciente Nov 09', '999.000.111-09', '(81) 98888-0009', 'Mãe 9', 'Pai 9', 'Organico', 'Itau', 120.00, 'Pix', 'Consulta Psiquiatra', '2025-11-28', 'efetuado', '2025-11-28 09:00:00'),
(68, '111111111110', 1, 100, 'Paciente Nov 10', '000.111.222-10', '(81) 98888-0010', NULL, NULL, 'Marketing', 'Bradesco', 400.00, 'Espécie', 'Proase', '2025-11-30', 'efetuado', '2025-11-30 14:00:00'),
(69, '202512010001', 1, 116, 'Ana Silva Dez 01', '123.456.789-01', '(81) 99999-0001', NULL, NULL, 'Organico', 'Itau', 300.00, 'Pix', 'Avaliação T', '2025-12-01', 'efetuado', '2025-12-01 08:00:00'),
(70, '202512010002', 1, 134, 'Bruno Costa Dez 02', '234.567.890-02', '(81) 99999-0002', NULL, NULL, 'Marketing', 'Bradesco', 250.00, 'Crédito', 'Avaliação F', '2025-12-02', 'efetuado', '2025-12-02 09:30:00'),
(71, '202512010003', 1, 100, 'Carlos Souza Dez 03', '345.678.901-03', '(81) 99999-0003', 'Resp Carlos', NULL, 'Organico', 'Itau', 500.00, 'Débito', 'Plano Mensal', '2025-12-03', 'efetuado', '2025-12-03 10:45:00'),
(72, '202512010004', 1, 100, 'Daniela Lima Dez 04', '456.789.012-04', '(81) 99999-0004', NULL, NULL, 'Marketing', 'Itau', 150.00, 'Pix', 'Consulta Nutrição', '2025-12-04', 'efetuado', '2025-12-04 11:15:00'),
(73, '202512010005', 1, 126, 'Eduardo Gomes Dez 05', '567.890.123-05', '(81) 99999-0005', 'Mãe Edu', NULL, 'Organico', 'Bradesco', 400.00, 'Espécie', 'Avaliação N', '2025-12-05', 'efetuado', '2025-12-05 13:00:00'),
(74, '202512010006', 1, 121, 'Fernanda Alves Dez 06', '678.901.234-06', '(81) 99999-0006', NULL, NULL, 'Marketing', 'Itau', 200.00, 'Pix / Qrcode', 'Visita E', '2025-12-06', 'efetuado', '2025-12-06 14:20:00'),
(75, '202512010007', 1, 129, 'Gabriel Martins Dez 07', '789.012.345-07', '(81) 99999-0007', 'Resp Gab', NULL, 'Organico', 'Bradesco', 600.00, 'Crédito', 'Plano Mensal', '2025-12-07', 'efetuado', '2025-12-07 15:40:00'),
(76, '202512010008', 1, 107, 'Helena Rocha Dez 08', '890.123.456-08', '(81) 99999-0008', NULL, NULL, 'Marketing', 'Itau', 350.00, 'Débito', 'Avaliação T', '2025-12-08', 'efetuado', '2025-12-08 16:50:00'),
(77, '202512010009', 1, 137, 'Igor Santos Dez 09', '901.234.567-09', '(81) 99999-0009', 'Mãe Igor', NULL, 'Organico', 'Itau', 120.00, 'Pix', 'Consulta Psiquiatra', '2025-12-09', 'efetuado', '2025-12-09 09:00:00'),
(78, '202512010010', 1, 109, 'Julia Pereira Dez 10', '012.345.678-10', '(81) 99999-0010', NULL, NULL, 'Marketing', 'Bradesco', 400.00, 'Espécie', 'Proase', '2025-12-10', 'efetuado', '2025-12-10 10:30:00'),
(79, '202512010011', 1, 117, 'Lucas Oliveira Dez 11', '111.222.333-11', '(81) 99999-0011', NULL, NULL, 'Organico', 'Itau', 280.00, 'Pix', 'Avaliação T', '2025-12-11', 'efetuado', '2025-12-11 08:15:00'),
(80, '202512010012', 1, 121, 'Mariana Costa Dez 12', '222.333.444-12', '(81) 99999-0012', NULL, NULL, 'Marketing', 'Bradesco', 320.00, 'Crédito', 'Avaliação F', '2025-12-11', 'efetuado', '2025-12-11 09:45:00'),
(81, '202512010013', 1, 104, 'Nicolas Ferreira Dez 13', '333.444.555-13', '(81) 99999-0013', 'Mãe Nic', NULL, 'Organico', 'Itau', 550.00, 'Débito', 'Plano Mensal', '2025-12-12', 'efetuado', '2025-12-12 11:00:00'),
(82, '202512010014', 1, 118, 'Olivia Santos Dez 14', '444.555.666-14', '(81) 99999-0014', NULL, NULL, 'Marketing', 'Itau', 180.00, 'Pix', 'Consulta Nutrição', '2025-12-12', 'efetuado', '2025-12-12 13:30:00'),
(83, '202512010015', 1, 125, 'Pedro Henrique Dez 15', '555.666.777-15', '(81) 99999-0015', 'Resp Pedro', NULL, 'Organico', 'Bradesco', 420.00, 'Espécie', 'Avaliação N', '2025-12-13', 'efetuado', '2025-12-13 14:45:00'),
(84, '202512010016', 1, 100, 'Quiteria Silva Dez 16', '666.777.888-16', '(81) 99999-0016', NULL, NULL, 'Marketing', 'Itau', 220.00, 'Pix / Qrcode', 'Visita E', '2025-12-13', 'efetuado', '2025-12-13 16:00:00'),
(85, '202512010017', 1, 114, 'Rafael Souza Dez 17', '777.888.999-17', '(81) 99999-0017', 'Mãe Rafa', NULL, 'Organico', 'Bradesco', 650.00, 'Crédito', 'Plano Mensal', '2025-12-14', 'efetuado', '2025-12-14 08:30:00'),
(86, '202512010018', 1, 136, 'Sarah Lima Dez 18', '888.999.000-18', '(81) 99999-0018', NULL, NULL, 'Marketing', 'Itau', 380.00, 'Débito', 'Avaliação T', '2025-12-14', 'efetuado', '2025-12-14 10:00:00'),
(87, '202512010019', 1, 121, 'Thiago Gomes Dez 19', '999.000.111-19', '(81) 99999-0019', 'Resp Thiago', NULL, 'Organico', 'Itau', 130.00, 'Pix', 'Consulta Psiquiatra', '2025-12-15', 'efetuado', '2025-12-15 11:30:00'),
(88, '202512010020', 1, 134, 'Ursula Alves Dez 20', '000.111.222-20', '(81) 99999-0020', NULL, NULL, 'Marketing', 'Bradesco', 450.00, 'Espécie', 'Proase', '2025-12-15', 'efetuado', '2025-12-15 13:00:00'),
(89, '202512010021', 1, 135, 'Victor Martins Dez 21', '121.212.121-21', '(81) 98888-0021', 'Mãe Victor', NULL, 'Organico', 'Itau', 300.00, 'Pix', 'Avaliação T', '2025-12-16', 'efetuado', '2025-12-16 14:15:00'),
(90, '202512010022', 1, 125, 'Wagner Rocha Dez 22', '232.323.232-22', '(81) 98888-0022', NULL, NULL, 'Marketing', 'Bradesco', 250.00, 'Crédito', 'Avaliação F', '2025-12-16', 'efetuado', '2025-12-16 15:30:00'),
(91, '202512010023', 1, 118, 'Xuxa Meneghel Dez 23', '343.434.343-23', '(81) 98888-0023', 'Resp Xuxa', NULL, 'Organico', 'Itau', 500.00, 'Débito', 'Plano Mensal', '2025-12-17', 'efetuado', '2025-12-17 09:00:00'),
(92, '202512010024', 1, 135, 'Yasmin Brunet Dez 24', '454.545.454-24', '(81) 98888-0024', NULL, NULL, 'Marketing', 'Itau', 150.00, 'Pix', 'Consulta Nutrição', '2025-12-17', 'efetuado', '2025-12-17 10:30:00'),
(93, '202512010025', 1, 119, 'Zeca Pagodinho Dez 25', '565.656.565-25', '(81) 98888-0025', 'Mãe Zeca', NULL, 'Organico', 'Bradesco', 400.00, 'Espécie', 'Avaliação N', '2025-12-18', 'efetuado', '2025-12-18 13:00:00'),
(94, '202512010026', 1, 117, 'Ana Clara Dez 26', '676.767.676-26', '(81) 98888-0026', NULL, NULL, 'Marketing', 'Itau', 200.00, 'Pix / Qrcode', 'Visita E', '2025-12-18', 'efetuado', '2025-12-18 14:30:00'),
(95, '202512010027', 1, 119, 'Bia Haddad Dez 27', '787.878.787-27', '(81) 98888-0027', 'Resp Bia', NULL, 'Organico', 'Bradesco', 600.00, 'Crédito', 'Plano Mensal', '2025-12-19', 'efetuado', '2025-12-19 16:00:00'),
(96, '202512010028', 1, 104, 'Caio Castro Dez 28', '898.989.989-28', '(81) 98888-0028', NULL, NULL, 'Marketing', 'Itau', 350.00, 'Débito', 'Avaliação T', '2025-12-19', 'efetuado', '2025-12-19 08:30:00'),
(97, '202512010029', 1, 136, 'Dado Dolabella Dez 29', '909.090.909-29', '(81) 98888-0029', 'Mãe Dado', NULL, 'Organico', 'Itau', 120.00, 'Pix', 'Consulta Psiquiatra', '2025-12-20', 'efetuado', '2025-12-20 10:00:00'),
(98, '202512010030', 1, 121, 'Eliana Michaelichen Dez 30', '010.101.010-30', '(81) 98888-0030', NULL, NULL, 'Marketing', 'Bradesco', 400.00, 'Espécie', 'Proase', '2025-12-20', 'efetuado', '2025-12-20 11:30:00'),
(99, '202512010031', 1, 138, 'Fabio Porchat Dez 31', '121.212.121-31', '(81) 97777-0031', 'Resp Fabio', NULL, 'Organico', 'Itau', 280.00, 'Pix', 'Avaliação T', '2025-12-21', 'efetuado', '2025-12-21 13:00:00'),
(100, '202512010032', 1, 138, 'Gisele Bundchen Dez 32', '232.323.232-32', '(81) 97777-0032', NULL, NULL, 'Marketing', 'Bradesco', 320.00, 'Crédito', 'Avaliação F', '2025-12-21', 'efetuado', '2025-12-21 14:45:00'),
(101, '202512010033', 1, 129, 'Humberto Martins Dez 33', '343.434.343-33', '(81) 97777-0033', 'Mãe Humberto', NULL, 'Organico', 'Itau', 550.00, 'Débito', 'Plano Mensal', '2025-12-22', 'efetuado', '2025-12-22 16:15:00'),
(102, '202512010034', 1, 126, 'Ivete Sangalo Dez 34', '454.545.454-34', '(81) 97777-0034', NULL, NULL, 'Marketing', 'Itau', 180.00, 'Pix', 'Consulta Nutrição', '2025-12-22', 'efetuado', '2025-12-22 09:00:00'),
(103, '202512010035', 1, 129, 'Jojo Todynho Dez 35', '565.656.565-35', '(81) 97777-0035', 'Resp Jojo', NULL, 'Organico', 'Bradesco', 420.00, 'Espécie', 'Avaliação N', '2025-12-23', 'efetuado', '2025-12-23 10:30:00'),
(104, '202512010036', 1, 136, 'Kevinho Dez 36', '676.767.676-36', '(81) 97777-0036', NULL, NULL, 'Marketing', 'Itau', 220.00, 'Pix / Qrcode', 'Visita E', '2025-12-23', 'efetuado', '2025-12-23 13:00:00'),
(105, '202512010037', 1, 118, 'Luan Santana Dez 37', '787.878.787-37', '(81) 97777-0037', 'Mãe Luan', NULL, 'Organico', 'Bradesco', 650.00, 'Crédito', 'Plano Mensal', '2025-12-24', 'efetuado', '2025-12-24 14:15:00'),
(106, '202512010038', 1, 135, 'Marilia Mendonca Dez 38', '898.989.989-38', '(81) 97777-0038', NULL, NULL, 'Marketing', 'Itau', 380.00, 'Débito', 'Avaliação T', '2025-12-24', 'efetuado', '2025-12-24 15:30:00'),
(107, '202512010039', 1, 122, 'Neymar Jr Dez 39', '909.090.909-39', '(81) 97777-0039', 'Resp Neymar', NULL, 'Organico', 'Itau', 130.00, 'Pix', 'Consulta Psiquiatra', '2025-12-25', 'efetuado', '2025-12-25 08:30:00'),
(108, '202512010040', 1, 128, 'Otaviano Costa Dez 40', '010.101.010-40', '(81) 97777-0040', '', '', NULL, 'Bradesco', 450.00, 'Espécie', NULL, '2025-12-16', 'efetuado', '2025-12-25 10:00:00'),
(109, '822033531987', 3, 121, 'Ana Clara Souza', '111.222.333-44', '(11) 99999-1001', 'Ana Clara Souza', NULL, NULL, 'Itau', 560.00, NULL, 'Plano Mensal', '2025-12-17', 'efetuado', '2025-12-17 20:00:57'),
(110, '000124217267', 6, 122, 'Ana Clara Souza', '111.222.333-44', '(11) 99999-1001', 'Ana Clara Souza', NULL, NULL, 'Itau', 500.00, NULL, 'Plano Mensal', '2025-12-17', 'efetuado', '2025-12-17 20:15:18'),
(111, '288344297241', 3, 100, 'Yuri Alberto', '567.765.567-76', '(11) 99999-1025', 'Yuri Alberto', NULL, NULL, 'Itau', 350.00, NULL, 'Proase', '2025-12-26', 'efetuado', '2025-12-17 18:55:39'),
(112, '225567411056', 8, 100, 'Gabriella Soares Mendes da Silva', '144.519.414-74', '(81) 98992-1361', 'Lillian Batista Soares', NULL, NULL, 'Itau', 412.50, NULL, 'Plano Mensal', '2025-12-18', 'efetuado', '2025-12-18 12:20:38'),
(113, '961281369446', 7, 119, 'teste 1 ', '', '', '', NULL, NULL, 'Itau', 1000.00, NULL, 'Plano Mensal', '2025-12-18', 'efetuado', '2025-12-18 13:20:23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios_a`
--

CREATE TABLE `usuarios_a` (
  `id_user` int UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nivel` int DEFAULT '1',
  `status` int DEFAULT '1',
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios_a`
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
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_paciente_prof` (`id_prof_referencia`);

--
-- Índices de tabela `profissionais`
--
ALTER TABLE `profissionais`
  ADD PRIMARY KEY (`id_prof`);

--
-- Índices de tabela `sessoes`
--
ALTER TABLE `sessoes`
  ADD PRIMARY KEY (`id_sessao`),
  ADD KEY `fk_sessao_token` (`id_token`);

--
-- Índices de tabela `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id_token`),
  ADD KEY `idx_token_user` (`id_user`),
  ADD KEY `idx_token_prof` (`id_prof`);

--
-- Índices de tabela `usuarios_a`
--
ALTER TABLE `usuarios_a`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de tabela `profissionais`
--
ALTER TABLE `profissionais`
  MODIFY `id_prof` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de tabela `sessoes`
--
ALTER TABLE `sessoes`
  MODIFY `id_sessao` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT de tabela `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id_token` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `usuarios_a`
--
ALTER TABLE `usuarios_a`
  MODIFY `id_user` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_paciente_prof` FOREIGN KEY (`id_prof_referencia`) REFERENCES `profissionais` (`id_prof`) ON DELETE SET NULL;

--
-- Restrições para tabelas `sessoes`
--
ALTER TABLE `sessoes`
  ADD CONSTRAINT `fk_sessoes_token` FOREIGN KEY (`id_token`) REFERENCES `tokens` (`id_token`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `fk_tokens_prof` FOREIGN KEY (`id_prof`) REFERENCES `profissionais` (`id_prof`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tokens_user` FOREIGN KEY (`id_user`) REFERENCES `usuarios_a` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
