<?php
// app/Core/Router.php

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
        // Pega a URL atual (ex: /login) ignorando parâmetros GET (?id=1)
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        $method = $_SERVER['REQUEST_METHOD'];

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
                    echo "Erro: Método '$action' não encontrado em '$controllerClass'.";
                }
            } else {
                echo "Erro: Controlador '$controllerClass' não encontrado.";
            }
        } else {
            // Rota não encontrada (404)
            // Se tiver uma view 404 personalizada, carregue-a aqui
            http_response_code(404);
            require __DIR__ . '/../views/pages/404.php';
        }
    }
}