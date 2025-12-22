<?php
/**
 * TESTE DE ESTRUTURA MVC E ROTAS
 * Salve em: /app.clinicaassista.com.br/teste_mvc.php
 * Acesse: http://localhost:8000/teste_mvc.php
 */

ini_set('display_errors', 1);
error_reporting(E_ALL);

define('ROOT_PATH', dirname(__DIR__));
define('APP_PATH', ROOT_PATH . '/app');
define('PUBLIC_PATH', __DIR__);

echo "<style>body{font-family:sans-serif;line-height:1.5} .ok{color:green;font-weight:bold} .fail{color:red;font-weight:bold} .warn{color:orange;font-weight:bold}</style>";
echo "<h1>Diagnóstico de Estrutura MVC</h1>";

// 1. CARREGAMENTO DO AUTOLOAD
echo "<h3>1. Carregamento do Composer Autoload</h3>";
$autoload = ROOT_PATH . '/vendor/autoload.php';
if (file_exists($autoload)) {
    require $autoload;
    echo "<div class='ok'>[OK] Autoload carregado.</div>";
} else {
    echo "<div class='fail'>[ERRO] Autoload não encontrado em: $autoload</div>";
    exit;
}

// 2. CARREGAMENTO DO .ENV
echo "<h3>2. Variáveis de Ambiente (.env)</h3>";
if (class_exists('Dotenv\Dotenv')) {
    try {
        $dotenv = Dotenv\Dotenv::createImmutable(ROOT_PATH);
        $dotenv->load();
        echo "<div class='ok'>[OK] Arquivo .env carregado via vlucas/phpdotenv.</div>";
    } catch (Exception $e) {
        echo "<div class='warn'>[AVISO] " . $e->getMessage() . " (Verifique se o arquivo .env existe na raiz)</div>";
    }
} else {
    echo "<div class='fail'>[ERRO] Biblioteca Dotenv não encontrada no vendor.</div>";
}

// 3. VERIFICAÇÃO DE CLASSES CRÍTICAS
// Verifica se o namespace está configurado corretamente no composer.json (PSR-4)
echo "<h3>3. Verificação de Classes (Namespaces)</h3>";
$classes_to_test = [
    'App\Core\Router',
    'App\Core\Auth',
    'App\Controllers\BaseController' => 'app/Controllers/BaseController.php', // Corrigido para Controllers
    'App\Controllers\HomeController',
    'App\Models\UserModel'
];

echo "<ul>";
foreach ($classes_to_test as $class => $file_hint) {
    if (is_int($class)) { $class = $file_hint; $file_hint = ''; } // Ajuste array index
    
    if (class_exists($class)) {
        echo "<li><span class='ok'>[OK]</span> Classe <code>$class</code> carregada.</li>";
    } else {
        echo "<li><span class='fail'>[FALHA]</span> Classe <code>$class</code> NÃO encontrada. <br><small>Verifique se o namespace no arquivo bate com o `composer.json`.</small></li>";
    }
}
echo "</ul>";

// 4. VERIFICAÇÃO DE VIEWS FÍSICAS
echo "<h3>4. Verificação de Arquivos de View</h3>";
$views_to_test = [
    'pages/home.phtml',
    'pages/login.phtml',
    'partials/header.php',
    'layout.php'
];

echo "<ul>";
foreach ($views_to_test as $view) {
    $path = APP_PATH . '/Views/' . $view;
    if (file_exists($path)) {
        echo "<li><span class='ok'>[OK]</span> View encontrada: <code>app/Views/$view</code></li>";
    } else {
        echo "<li><span class='fail'>[FALHA]</span> View NÃO encontrada em: <code>$path</code></li>";
    }
}
echo "</ul>";

// 5. SIMULAÇÃO DE ROTAS
echo "<h3>5. Teste de Leitura de Rotas</h3>";
echo "<div>Tentando incluir <code>app/Routes/routes.php</code>...</div>";

if (class_exists('App\Core\Router')) {
    // Tenta instanciar o Router para ver se o arquivo de rotas consegue usar a variável $router
    $router = new App\Core\Router();
    
    $routesFile = APP_PATH . '/Routes/routes.php';
    
    if (file_exists($routesFile)) {
        try {
            // Isolando escopo para simular o index.php
            (function($router, $file) {
                require $file;
            })($router, $routesFile);
            
            echo "<div class='ok'>[OK] Arquivo de rotas incluído sem erros PHP.</div>";
            
            // Tenta inspecionar as rotas registradas (Reflection)
            echo "<p><b>Tabela de Rotas Detectadas (Debug):</b></p>";
            try {
                $ref = new ReflectionClass($router);
                $props = $ref->getProperties();
                $found = false;
                foreach($props as $prop) {
                    $prop->setAccessible(true);
                    $val = $prop->getValue($router);
                    if(is_array($val) && count($val) > 0) {
                        echo "<pre style='background:#f4f4f4;padding:10px'>";
                        print_r($val);
                        echo "</pre>";
                        $found = true;
                        break; // Mostra o primeiro array encontrado (geralmente é a lista de rotas)
                    }
                }
                if(!$found) echo "<div class='warn'>Rotas carregadas, mas não foi possível visualizá-las (propriedade privada/protegida).</div>";
            } catch(Exception $ex) { echo "Erro ao inspecionar router: " . $ex->getMessage(); }

        } catch (Error $e) {
            echo "<div class='fail'>[ERRO FATAL] Erro ao processar arquivo de rotas: " . $e->getMessage() . "</div>";
            echo "<small>Dica: Verifique se o arquivo routes.php espera uma variável <code>\$router</code> ou usa métodos estáticos.</small>";
        }
    } else {
        echo "<div class='fail'>[ERRO] Arquivo de rotas não encontrado: $routesFile</div>";
    }
} else {
    echo "<div class='fail'>Classe Router não existe, pulando teste de rotas.</div>";
}
?>