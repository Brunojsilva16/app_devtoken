<?php
/**
 * PONTO DE ENTRADA PRINCIPAL
 * Configura o ambiente, carrega rotas e dispara a aplicação.
 */

// 1. Configurações de Erro (Essencial para diagnosticar problemas)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// 2. Definição de Constantes de Caminho Físico
define('ROOT_PATH', dirname(__DIR__));
define('APP_PATH', ROOT_PATH . '/app');

try {
    // 3. Definir URL_BASE (Correção para o erro do Auth.php)
    // Isso detecta automaticamente: http://localhost/app_controle/app.clinicaassista.com.br
    $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    $domainName = $_SERVER['HTTP_HOST'];
    $path = str_replace('\\', '/', dirname($_SERVER['SCRIPT_NAME']));
    $path = rtrim($path, '/');
    
    // Define a constante globalmente
    define('URL_BASE', $protocol . $domainName . $path);

    // 4. Carregar Autoload (Composer)
    $autoloadPath = ROOT_PATH . '/vendor/autoload.php';
    if (!file_exists($autoloadPath)) {
        die("Erro Crítico: Pasta 'vendor' não encontrada. Execute 'composer install' na raiz do projeto.");
    }
    require_once $autoloadPath;

    // 5. Carregar Variáveis de Ambiente (.env)
    if (class_exists('Dotenv\Dotenv')) {
        $dotenv = Dotenv\Dotenv::createImmutable(ROOT_PATH);
        $dotenv->safeLoad();
    }

    // 6. Inicializar Sessão
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    // 7. Configuração de Timezone
    date_default_timezone_set('America/Sao_Paulo');

    // 8. Instanciar Roteador
    if (!class_exists('App\Core\Router')) {
         throw new Exception("Classe App\Core\Router não encontrada.");
    }
    
    $router = new App\Core\Router();

    // 9. Importar Rotas
    $routesPath = APP_PATH . '/Routes/routes.php';
    if (file_exists($routesPath)) {
        require_once $routesPath;
    } else {
        throw new Exception("Arquivo de rotas não encontrado em: $routesPath");
    }

    // 10. Executar (Dispatch)
    $router->dispatch();

} catch (Throwable $e) {
    // Tratamento visual de erros
    echo "<div style='font-family: sans-serif; padding: 20px; background: #fff0f0; border: 1px solid #ffcccc; margin: 20px; border-radius: 5px;'>";
    echo "<h2 style='color: #cc0000; margin-top: 0;'>Erro na Aplicação</h2>";
    echo "<p><strong>Mensagem:</strong> " . htmlspecialchars($e->getMessage()) . "</p>";
    echo "<p><strong>Local:</strong> " . $e->getFile() . " na linha <strong>" . $e->getLine() . "</strong></p>";
    echo "<hr style='border: 0; border-top: 1px solid #ffcccc;'>";
    echo "<strong>Stack Trace:</strong>";
    echo "<pre style='background: #fff; padding: 10px; border: 1px solid #ddd; overflow: auto; font-size: 13px;'>" . $e->getTraceAsString() . "</pre>";
    echo "</div>";
}