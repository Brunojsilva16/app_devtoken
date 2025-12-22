<?php

namespace App\Controllers;

class BaseController
{
    /**
     * Renderiza uma view dentro do layout principal.
     * * @param string $viewName O caminho da view (ex: 'pages/home')
     * @param array $data Dados para serem usados na view
     */
    protected function view($viewName, $data = [])
    {
        // Extrai os dados para variáveis locais
        extract($data);
        
        // Caminho da view específica
        $viewPath = __DIR__ . "/../Views/" . $viewName . ".phtml";
        
        if (file_exists($viewPath)) {
            // Inicia o buffer de saída
            ob_start();
            
            // Inclui a view específica (ela não vai aparecer na tela ainda)
            require $viewPath;
            
            // Pega o conteúdo do buffer e limpa
            $content = ob_get_clean();
            
            // Carrega o layout principal, passando o $content
            require __DIR__ . "/../Views/layout.php";
            
        } else {
            echo "Erro: View '$viewName' não encontrada em $viewPath.";
        }
    }

    protected function redirect($url)
    {
        header("Location: " . URL_BASE . $url);
        exit;
    }
}