<?php
// app/Controllers/AuthController.php

namespace App\Controllers;

use App\Core\Auth;
use App\Models\UserModel;

class AuthController extends BaseController
{
    public function loginForm()
    {
        // Se já estiver logado, manda pra home
        if (Auth::isLogged()) {
            $this->redirect('/home');
            return;
        }

        // Renderiza a view de login
        // Verifica se tem mensagem de erro na sessão para exibir
        $error = $_SESSION['flash_error'] ?? null;
        unset($_SESSION['flash_error']);

        // A view de login pode ser um include simples ou renderizado pelo BaseController
        // Assumindo que você tem uma view 'pages/login'
        // Se for um arquivo solto .phtml, você pode fazer um include ou usar o método view

        // Exemplo usando o método view herdado:
        $this->view('pages/login', [
            'error' => $error,

            'pageStyles' => [
                'css/login-custom.css'
            ]
        ], false);
        // O 3º parametro false indica para não carregar o layout padrão (header/footer) se a lógica da sua view method permitir
    }

    public function authenticate()
    {
        // Verifica se é POST
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            $this->redirect('/login');
            return;
        }

        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
        $password = $_POST['senha'] ?? '';

        if (empty($email) || empty($password)) {
            $_SESSION['flash_error'] = 'Preencha todos os campos.';
            $this->redirect('/login');
            return;
        }

        $userModel = new UserModel();
        $user = $userModel->authenticate($email, $password);

        if ($user) {
            // Verifica se o usuário está ativo
            if (isset($user['status']) && $user['status'] == 0) {
                $_SESSION['flash_error'] = 'Usuário inativo. Contate o suporte.';
                $this->redirect('/login');
                return;
            }

            // Login com sucesso
            Auth::login($user);

            // Redireciona para a Home/Dashboard
            $this->redirect('/home');
        } else {
            // Falha no login
            $_SESSION['flash_error'] = 'E-mail ou senha inválidos.';
            $this->redirect('/login');
        }
    }

    public function logout()
    {
        Auth::logout();
        $this->redirect('/login');
    }

    public function register()
    {
        // Exibe formulário de registro se necessário
        $this->view('pages/register');
    }

    public function store()
    {
        // Lógica de registro de novo usuário
        $nome = $_POST['nome'] ?? '';
        $email = $_POST['email'] ?? '';
        $senha = $_POST['senha'] ?? '';

        // ... validações ...

        $userModel = new UserModel();
        // Verifica se email já existe
        if ($userModel->findByEmail($email)) {
            $_SESSION['flash_error'] = 'E-mail já cadastrado.';
            $this->redirect('/register');
            return;
        }

        $dados = [
            'nome' => $nome,
            'email' => $email,
            'senha' => $senha, // UserModel vai fazer o hash
            'nivel' => 1
        ];

        if ($userModel->create($dados)) {
            $_SESSION['flash_success'] = 'Conta criada com sucesso! Faça login.';
            $this->redirect('/login');
        } else {
            $_SESSION['flash_error'] = 'Erro ao criar conta.';
            $this->redirect('/register');
        }
    }
}
