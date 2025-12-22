<?php
/**
 * Script de Diagnóstico Rápido
 * Salve este arquivo dentro de /app.clinicaassista.com.br/teste_diagnostico.php
 * Acesse pelo navegador: http://localhost:8000/teste_diagnostico.php
 * APAGUE ESTE ARQUIVO APÓS OS TESTES
 */

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

echo "<h1>Diagnóstico de Ambiente</h1>";

// 1. Teste de Versão do PHP
echo "<h3>1. Versão do PHP</h3>";
echo "Versão atual: " . phpversion();
if (version_compare(phpversion(), '7.4.0', '<')) {
    echo " <span style='color:red'>[ALERTA: Recomenda-se PHP 7.4 ou superior]</span>";
} else {
    echo " <span style='color:green'>[OK]</span>";
}

// 2. Teste de Carregamento do Autoload
echo "<h3>2. Estrutura de Diretórios e Autoload</h3>";
$autoloadPath = __DIR__ . '/../vendor/autoload.php';

if (file_exists($autoloadPath)) {
    echo "Autoload encontrado em: $autoloadPath <span style='color:green'>[OK]</span><br>";
    require_once $autoloadPath;
    echo "Composer Autoload carregado com sucesso.";
} else {
    echo "<span style='color:red'>[ERRO] Autoload não encontrado em: $autoloadPath.</span><br>";
    echo "Certifique-se de que a pasta 'vendor' está um nível acima desta pasta pública.";
    exit; // Para aqui se não tiver autoload
}

// 3. Teste de Leitura do .env
echo "<h3>3. Leitura do arquivo .env</h3>";
$envPath = __DIR__ . '/../.env';
if (file_exists($envPath)) {
    echo "Arquivo .env encontrado. <span style='color:green'>[OK]</span><br>";
    
    // Tenta carregar usando a biblioteca (assumindo que está instalada)
    try {
        $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
        $dotenv->load();
        echo "Variáveis de ambiente carregadas.";
    } catch (Exception $e) {
        echo "<span style='color:orange'>[AVISO] Não foi possível carregar o .env via classe Dotenv: " . $e->getMessage() . "</span>";
    }
} else {
    echo "<span style='color:red'>[ERRO] Arquivo .env não encontrado na raiz do projeto. Crie-o baseando-se no .env.example.</span>";
}

// 4. Teste de Conexão com Banco de Dados
echo "<h3>4. Conexão com Banco de Dados</h3>";

$host = $_ENV['DB_HOST'] ?? getenv('DB_HOST') ?? '127.0.0.1';
$db   = $_ENV['DB_DATABASE'] ?? getenv('DB_DATABASE') ?? 'tb_token';
$user = $_ENV['DB_USERNAME'] ?? getenv('DB_USERNAME') ?? 'root';
$pass = $_ENV['DB_PASSWORD'] ?? getenv('DB_PASSWORD') ?? '';
$port = $_ENV['DB_PORT'] ?? getenv('DB_PORT') ?? '3306';

echo "Tentando conectar em <b>$host</b> (Banco: $db)...<br>";

try {
    $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    
    $pdo = new PDO($dsn, $user, $pass, $options);
    echo "<span style='color:green'><strong>SUCESSO: Conexão com o banco de dados estabelecida!</strong></span>";
    
} catch (\PDOException $e) {
    echo "<span style='color:red'><strong>FALHA NA CONEXÃO:</strong> " . $e->getMessage() . "</span><br>";
    echo "<small>Verifique suas credenciais no arquivo .env</small>";
}
?>