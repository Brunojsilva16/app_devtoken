<?php
// app/Core/Auth.php

namespace App\Core;

class Auth
{
    /**
     * Inicia a sessão se ainda não estiver iniciada.
     * Deve ser chamado no início da aplicação (ex: no index.php ou bootstrap).
     */
    public static function init()
    {
        if (session_status() !== PHP_SESSION_ACTIVE) {
            session_start();
        }
    }

    /**
     * Realiza o login do usuário na sessão.
     * * @param array|object $user Dados do usuário vindos do banco
     */
    public static function login($user)
    {
        // Converte objeto para array se necessário
        if (is_object($user)) {
            $user = (array) $user;
        }

        // Segurança: Regenera o ID da sessão para evitar Session Fixation
        session_regenerate_id(true);

        $_SESSION['user_id'] = $user['id_user'];
        $_SESSION['user_name'] = $user['nome'];
        $_SESSION['user_email'] = $user['email'];
        $_SESSION['user_level'] = $user['nivel'] ?? 1;
        $_SESSION['logged_in'] = true;
        
        // Opcional: Salvar timestamp do último login
        $_SESSION['last_activity'] = time();
    }

    /**
     * Realiza o logout e limpa a sessão.
     */
    public static function logout()
    {
        $_SESSION = [];
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }
        session_destroy();
    }

    /**
     * Verifica se o usuário está logado.
     * @return bool
     */
    public static function isLogged()
    {
        return isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true;
    }

    /**
     * Retorna o ID do usuário logado ou null.
     */
    public static function id()
    {
        return $_SESSION['user_id'] ?? null;
    }

    /**
     * Retorna o Nome do usuário logado.
     */
    public static function name()
    {
        return $_SESSION['user_name'] ?? 'Visitante';
    }
    
    /**
     * Retorna o Email do usuário logado.
     */
    public static function email()
    {
        return $_SESSION['user_email'] ?? '';
    }

    /**
     * Método auxiliar para checar e redirecionar se não estiver logado.
     * Uso: Auth::protect(); dentro de um Controller.
     */
    public static function protect()
    {
        if (!self::isLogged()) {
            // Redireciona para login
            header('Location: ' . URL_BASE . '/login');
            exit;
        }
    }
}