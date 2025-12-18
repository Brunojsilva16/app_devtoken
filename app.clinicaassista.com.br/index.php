<?php
// public/index.php

// --- CORREÇÃO ESSENCIAL ---
// Inicia a sessão PHP logo no início da execução.
// Isso evita o erro "Session ID cannot be regenerated when there is no active session".
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Configurações de erro (Em produção, mude para 0)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Caminho para o autoload do Composer (voltando um nível da pasta public)
require_once __DIR__ . '/../vendor/autoload.php';

use App\Core\Router;

// Carregar variáveis de ambiente (.env)
try {
    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
    $dotenv->load();
} catch (\Exception $e) {
    // Se não tiver .env, segue o fluxo (produção pode usar variáveis do servidor)
}

// Configuração de Fuso Horário
date_default_timezone_set('America/Sao_Paulo');

// Definição da URL Base (Fallback se não estiver no .env)
if (!defined('URL_BASE')) {
    define('URL_BASE', $_ENV['URL_BASE'] ?? 'https://app.clinicaassista.com.br');
}

// Inicializa o Roteador
$router = new Router();

// Carrega o arquivo de rotas
require_once __DIR__ . '/../app/Routes/routes.php';

// Dispara a aplicação
$router->dispatch();