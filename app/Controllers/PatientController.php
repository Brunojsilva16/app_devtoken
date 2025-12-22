<?php
// app/Controllers/PatientController.php

namespace App\Controllers;

use App\Models\PatientModel;
use App\Models\ProfessionalModel;
use Throwable;

class PatientController extends BaseController
{
    public function create()
    {
        if (!isset($_SESSION['user_id'])) {
            $this->redirect('/login');
            return;
        }

        $profModel = new ProfessionalModel();
        $profissionais = $profModel->getAll();

        $this->view('pages/cadastro_paciente', [
            'profissionais' => $profissionais,
            'success' => $_SESSION['flash_success'] ?? null,
            'error' => $_SESSION['flash_error'] ?? null
        ]);

        unset($_SESSION['flash_success'], $_SESSION['flash_error']);
    }

    public function store()
    {
        if (!isset($_SESSION['user_id'])) {
            $this->redirect('/login');
            return;
        }

        $origem = $_POST['origem'] ?? null;

        $dados = [
            'nome' => $_POST['nome'] ?? '', 
            'cpf' => $_POST['cpf'] ?? '', 
            'telefone' => $_POST['telefone'] ?? null, // Captura o telefone
            'id_prof' => $_POST['id_prof'] ?? null,
            'nome_responsavel' => $_POST['nome_responsavel'] ?? null,
            'responsavel_financeiro' => $_POST['responsavel_financeiro'] ?? null,
            'origem' => $origem
        ];

        if (empty($dados['nome'])) {
            $_SESSION['flash_error'] = "O nome é obrigatório.";
            $this->redirect('/pacientes/cadastrar');
            return;
        }

        $patientModel = new PatientModel();
        
        if ($patientModel->create($dados)) {
            $_SESSION['flash_success'] = "Paciente <strong>{$dados['nome']}</strong> cadastrado com sucesso!";
        } else {
            $_SESSION['flash_error'] = "Erro ao cadastrar paciente. Verifique os dados.";
        }

        $this->redirect('/pacientes/cadastrar');
    }

    public function searchApi()
    {
        if (ob_get_length()) ob_clean(); 
        header('Content-Type: application/json; charset=utf-8');

        try {
            $term = $_GET['term'] ?? '';
            
            if (strlen($term) < 2) {
                echo json_encode([]);
                exit;
            }

            $patientModel = new PatientModel();
            $results = $patientModel->search($term);

            echo json_encode($results);

        } catch (Throwable $e) {
            http_response_code(500);
            echo json_encode([
                'error' => true,
                'message' => 'Erro interno ao buscar pacientes.'
            ]);
        }
        exit;
    }
}