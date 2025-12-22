<?php
// app/Models/UserModel.php

namespace App\Models;

use App\Database\Connection;
use PDO;
use Exception;

class UserModel
{
    protected $conn;
    protected $table = 'usuarios_a';

    public function __construct()
    {
        $this->conn = Connection::getInstance();
    }

    /**
     * Tenta autenticar um usuário pelo email e senha.
     * Realiza migração automática de senhas antigas (texto puro) para hash.
     * * @param string $email
     * @param string $password
     * @return array|false Retorna os dados do usuário ou false
     */
    public function authenticate($email, $password)
    {
        $sql = "SELECT * FROM {$this->table} WHERE email = :email LIMIT 1";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([':email' => $email]);
        
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            return false;
        }

        // 1. Verifica se a senha armazenada é um Hash válido
        // Se a senha no banco for longa e parecer um hash, usamos password_verify
        if (password_verify($password, $user['senha'])) {
            // Senha correta e segura
            unset($user['senha']); // Remove senha do array antes de retornar
            return $user;
        }
        
        // 2. Fallback para senhas legadas (Texto Puro ou MD5 antigo)
        // Se password_verify falhou, pode ser que a senha no banco esteja em texto puro.
        // CUIDADO: Isso é apenas para migração.
        if ($password === $user['senha']) {
            // A senha bateu como texto puro. Vamos atualizar para Hash seguro agora.
            $this->updatePassword($user['id_user'], $password);
            
            unset($user['senha']);
            return $user;
        }

        return false;
    }

    /**
     * Cria um novo usuário com senha hash segura.
     */
    public function create($data)
    {
        // Criptografa a senha antes de salvar
        $hashedPassword = password_hash($data['senha'], PASSWORD_DEFAULT);

        $sql = "INSERT INTO {$this->table} (nome, email, senha, nivel, status, data_cadastro) 
                VALUES (?, ?, ?, ?, ?, NOW())";
        
        $stmt = $this->conn->prepare($sql);
        
        return $stmt->execute([
            $data['nome'],
            $data['email'],
            $hashedPassword,
            $data['nivel'] ?? 1,
            $data['status'] ?? 1
        ]);
    }

    public function updatePassword($id, $newPassword)
    {
        $hash = password_hash($newPassword, PASSWORD_DEFAULT);
        $sql = "UPDATE {$this->table} SET senha = :senha WHERE id_user = :id";
        $stmt = $this->conn->prepare($sql);
        return $stmt->execute([':senha' => $hash, ':id' => $id]);
    }

    public function findByEmail($email)
    {
        $sql = "SELECT * FROM {$this->table} WHERE email = :email";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute([':email' => $email]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}