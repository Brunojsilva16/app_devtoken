<?php
// app/Controllers/HomeController.php

namespace App\Controllers;

use App\Core\Auth;
use App\Models\TokenModel;

class HomeController extends BaseController
{
    public function index()
    {
        // Define o fuso horário para garantir que 'hoje' seja o dia correto no Brasil
        date_default_timezone_set('America/Sao_Paulo');

        Auth::protect();

        $tokenModel = new TokenModel();

        // --- LÓGICA 1: ESTATÍSTICAS (Cards do Topo) ---
        // Busca um grande volume de dados APENAS para calcular os totais do mês/dia.
        // O segundo parâmetro vazio '' garante que não aplicamos filtro de busca aqui.
        $dadosEstatisticas = $tokenModel->getAllWithDetails(2000, ''); 

        $hoje = date('Y-m-d');
        $mesAtual = date('Y-m');

        $atendimentosHoje = 0;
        $faturamentoHoje = 0.00;
        $faturamentoMes = 0.00;
        
        // Total Geral deve ser a contagem real do banco, não apenas dos últimos 2000
        // Idealmente teríamos um método countAll() no Model, mas usaremos count() do array por enquanto
        $totalTokens = count($dadosEstatisticas);

        foreach ($dadosEstatisticas as $t) {
            // Garante que existe data_registro
            if (empty($t['data_registro'])) continue;

            $dataReg = substr($t['data_registro'], 0, 10); // Y-m-d
            $mesReg = substr($t['data_registro'], 0, 7);   // Y-m
            $valor = $t['valor'] ?? 0;

            if ($dataReg == $hoje) {
                $atendimentosHoje++;
                $faturamentoHoje += $valor;
            }

            if ($mesReg == $mesAtual) {
                $faturamentoMes += $valor;
            }
        }

        // --- LÓGICA 2: TABELA (Com Filtros da URL) ---
        $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;
        $search = $_GET['search'] ?? '';

        // Busca dados especificamente para a tabela (filtrados e paginados)
        $tabelaAtendimentos = $tokenModel->getAllWithDetails($limit, $search);

        $data = [
            'view' => 'home',
            
            // Dados calculados
            'atendimentos_hoje' => $atendimentosHoje,
            'faturamento_hoje' => $faturamentoHoje,
            'faturamento_mes' => $faturamentoMes,
            'total_tokens' => $totalTokens,
            
            // Dados da tabela
            'atendimentos' => $tabelaAtendimentos,
            
            // Filtros para manter na view
            'limit' => $limit,
            'search' => $search,
            
            'usuario_nome' => Auth::name(),
            'usuario_email' => Auth::email()
        ];

        $this->view('pages/home', $data);
    }
}