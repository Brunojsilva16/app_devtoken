<?php

namespace App\Database;

use PDO;
use PDOException;

class Connection {
    private static ?PDO $instance = null;

    public static function getInstance(): PDO {
        if (self::$instance === null) {
            // Nota: Se estiver usando .env, certifique-se que as chaves conferem
            // (ex: DB_DATABASE ou DB_NAME dependendo do seu .env)
            $host = $_ENV['DB_HOST'] ?? 'localhost';
            $db   = $_ENV['DB_DATABASE'] ?? $_ENV['DB_NAME'] ?? 'tb_token';
            $user = $_ENV['DB_USERNAME'] ?? $_ENV['DB_USER'] ?? 'root';
            $pass = $_ENV['DB_PASSWORD'] ?? $_ENV['DB_PASS'] ?? '';
            $port = $_ENV['DB_PORT'] ?? '3306';

            try {
                self::$instance = new PDO("mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4", $user, $pass);
                self::$instance->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                self::$instance->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
                
                // --- CORREÇÃO DE FUSO HORÁRIO (-3h) ---
                // Força o MySQL a alinhar com o horário de Brasília.
                self::$instance->exec("SET time_zone = '-03:00'");

            } catch (PDOException $e) {
                die("Erro de conexão: " . $e->getMessage());
            }
        }

        return self::$instance;
    }
}
