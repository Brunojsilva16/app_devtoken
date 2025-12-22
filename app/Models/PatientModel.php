<?php
// app/Models/PatientModel.php

namespace App\Models;

use App\Database\Connection;
use PDO;
use Exception;
use PDOException;

class PatientModel
{
    protected $conn;

    public function __construct()
    {
        $this->conn = Connection::getInstance();
    }

    public function create($data)
    {
        try {
            // Adicionado campo telefone
            $sql = "INSERT INTO pacientes (nome, cpf, telefone, id_prof_referencia, nome_responsavel, responsavel_financeiro, origem, data_cadastro) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
            
            $stmt = $this->conn->prepare($sql);
            
            return $stmt->execute([
                $data['nome'],
                $data['cpf'],
                $data['telefone'] ?? null, // Bind do telefone
                !empty($data['id_prof']) ? $data['id_prof'] : null,
                $data['nome_responsavel'] ?? null,
                $data['responsavel_financeiro'] ?? null,
                $data['origem'] ?? null
            ]);

        } catch (Exception $e) {
            // Fallback (se a coluna telefone não existir ainda, tenta o insert antigo para não quebrar tudo)
            try {
                $sqlBackup = "INSERT INTO pacientes (nome, cpf, id_prof_referencia, data_cadastro) 
                              VALUES (?, ?, ?, NOW())";
                $stmtBackup = $this->conn->prepare($sqlBackup);
                return $stmtBackup->execute([
                    $data['nome'],
                    $data['cpf'],
                    !empty($data['id_prof']) ? $data['id_prof'] : null
                ]);
            } catch (Exception $ex) {
                return false;
            }
        }
    }

    public function search($term)
    {
        $term = "%$term%";
        
        try {
            // Incluído telefone no SELECT
            $sql = "
            SELECT 
                nome, 
                cpf, 
                telefone,
                nome_responsavel as resp, 
                responsavel_financeiro as fin, 
                origem
            FROM pacientes 
            WHERE nome LIKE :term1 OR cpf LIKE :term2
            LIMIT 20";

            $stmt = $this->conn->prepare($sql);
            $stmt->execute([
                ':term1' => $term, 
                ':term2' => $term
            ]);
            
            return $stmt->fetchAll();

        } catch (PDOException $e) {
            return [];
        }
    }
}