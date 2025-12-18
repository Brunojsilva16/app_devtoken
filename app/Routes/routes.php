<?php
// app/Routes/routes.php

use App\Controllers\AuthController;
use App\Controllers\HomeController;
use App\Controllers\TokenController;
use App\Controllers\PatientController; 
use App\Controllers\TestController;
use App\Controllers\ReportController; // Adicione o Use

// --- Rotas de Teste ---
$router->get('/teste-conexao', TestController::class, 'testConnection');

// --- Auth ---
$router->get('/login', AuthController::class, 'loginForm');
$router->post('/login', AuthController::class, 'authenticate'); // Atualizado para authenticate
$router->get('/logout', AuthController::class, 'logout');

// --- Painel ---
$router->get('/', HomeController::class, 'index');
$router->get('/home', HomeController::class, 'index');

// --- Tokens ---
$router->get('/gerar-token', TokenController::class, 'create');
$router->post('/gerar-token/salvar', TokenController::class, 'store');
$router->get('/meus-tokens', TokenController::class, 'history');
$router->get('/token/imprimir', TokenController::class, 'print');
$router->post('/token/baixar', TokenController::class, 'settle');

// --- Pacientes ---
$router->get('/pacientes/cadastrar', PatientController::class, 'create');
$router->post('/pacientes/salvar', PatientController::class, 'store');
$router->get('/api/pacientes/busca', PatientController::class, 'searchApi');

// --- Edição de Token ---
$router->get('/token/editar', TokenController::class, 'edit');
$router->post('/token/atualizar', TokenController::class, 'update');

// --- RELATÓRIOS (NOVO) ---
$router->get('/relatorios', ReportController::class, 'index');         // Tela de Filtros
$router->get('/relatorios/gerar', ReportController::class, 'generate'); // Processamento