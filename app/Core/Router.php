<?php

namespace App\Core;

class Router
{
    private $routes = [];

    // Adiciona rota GET
    public function get($uri, $controller, $method)
    {
        $this->routes['GET'][$uri] = ['controller' => $controller, 'method' => $method];
    }

    // Adiciona rota POST
    public function post($uri, $controller, $method)
    {
        $this->routes['POST'][$uri] = ['controller' => $controller, 'method' => $method];
    }

    // Processa a rota atual
    public function dispatch()
    {
        $method = $_SERVER['REQUEST_METHOD'];
        $uri = $this->getCurrentUri(); // Usa função auxiliar para limpar a URL

        // Se a rota existir na lista
        if (isset($this->routes[$method][$uri])) {
            $route = $this->routes[$method][$uri];
            $controllerClass = $route['controller'];
            $action = $route['method'];

            // Instancia o controlador e chama o método
            if (class_exists($controllerClass)) {
                $controller = new $controllerClass();
                if (method_exists($controller, $action)) {
                    $controller->$action();
                    return;
                } else {
                    $this->showError("Método '$action' não encontrado no Controller '$controllerClass'.");
                }
            } else {
                $this->showError("Controller '$controllerClass' não foi encontrado. Verifique o namespace.");
            }
        } else {
            // ROTA NÃO ENCONTRADA (404)
            // Tenta carregar a view 404 bonita se existir
            http_response_code(404);
            $view404 = dirname(__DIR__) . '/Views/pages/404.php';
            
            if (file_exists($view404)) {
                require $view404;
            } else {
                // Se não tiver view 404, mostra o DEBUG
                $this->showDebug404($uri, $method);
            }
        }
    }

    // --- FUNÇÕES AUXILIARES ---

    // Limpa a URL para funcionar em subpastas (localhost/projeto/home -> /home)
    private function getCurrentUri()
    {
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        
        // Detecta a pasta onde o script está rodando
        $scriptDir = dirname($_SERVER['SCRIPT_NAME']);
        
        // Se estiver em subpasta, remove essa parte da URI
        if ($scriptDir !== '/' && strpos($uri, $scriptDir) === 0) {
            $uri = substr($uri, strlen($scriptDir));
        }

        // Garante que a URI comece com / e não seja vazia
        if ($uri === '' || $uri === false) {
            return '/';
        }
        return '/' . ltrim($uri, '/');
    }

    // Mostra erro genérico
    private function showError($message) {
        echo "<div style='color:red; font-family:sans-serif; padding:20px; border:1px solid red; background:#ffeeee;'>";
        echo "<h3>Erro de Roteamento</h3>";
        echo "<p>$message</p>";
        echo "</div>";
    }

    // Mostra detalhes técnicos quando a rota não é encontrada
    private function showDebug404($uriRecebida, $metodo) {
        echo "<div style='font-family: monospace; padding: 20px; background: #f8f9fa; border: 1px solid #ccc;'>";
        echo "<h2 style='color: #d9534f;'>Erro 404: Rota não encontrada</h2>";
        echo "<p><strong>URL Recebida:</strong> " . htmlspecialchars($uriRecebida) . "</p>";
        echo "<p><strong>Método:</strong> $metodo</p>";
        
        echo "<hr>";
        echo "<h3>Rotas Registradas ($metodo):</h3>";
        if (isset($this->routes[$metodo])) {
            echo "<ul>";
            foreach ($this->routes[$metodo] as $rota => $config) {
                echo "<li>" . htmlspecialchars($rota) . " -> " . $config['controller'] . "::" . $config['method'] . "</li>";
            }
            echo "</ul>";
        } else {
            echo "<p>Nenhuma rota registrada para o método $metodo.</p>";
        }
        echo "</div>";
    }
}