<?php
// app/Controllers/TestController.php

namespace App\Controllers;

use App\Database\Connection;
use PDO;

class TestController extends BaseController
{
    public function testConnection()
    {
        echo "<h2>Diagnóstico do Sistema</h2>";
        echo "<hr>";

        // 1. Teste de Ambiente
        echo "<p><strong>Ambiente:</strong> " . ($_ENV['APP_URL'] ?? 'Não definido') . "</p>";

        // 2. Teste de Banco de Dados
        try {
            $conn = Connection::getInstance();
            echo "<p style='color:green'><strong>✅ Conexão com Banco de Dados:</strong> SUCESSO!</p>";
            
            // Tenta listar tabelas
            echo "<p><strong>Tabelas encontradas:</strong></p>";
            $tables = $conn->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
            
            if ($tables) {
                echo "<ul>";
                foreach ($tables as $table) {
                    // Verifica se é a tabela de usuários
                    $destaque = ($table === 'usuarios_a' || $table === 'usuarios') ? 'style="color:blue; font-weight:bold"' : '';
                    echo "<li $destaque>$table</li>";
                }
                echo "</ul>";
            } else {
                echo "<p style='color:orange'>O banco está conectado, mas não possui tabelas.</p>";
            }

        } catch (\Exception $e) {
            echo "<p style='color:red'><strong>❌ Erro de Conexão:</strong> " . $e->getMessage() . "</p>";
            echo "<p>Verifique seu arquivo <code>.env</code>.</p>";
        }
    }
}