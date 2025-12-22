<?php

namespace App\Core;

class Paginator
{
    private $totalItems;
    private $itemsPerPage;
    private $currentPage;
    private $urlPattern;
    private $maxPagesToShow = 5; // Quantos botões numéricos aparecem

    public function __construct($totalItems, $itemsPerPage, $currentPage, $baseUrl = '?')
    {
        $this->totalItems = $totalItems;
        $this->itemsPerPage = $itemsPerPage;
        $this->currentPage = $currentPage;
        // Garante que a URL mantenha outros filtros (ex: &search=...)
        $this->urlPattern = $baseUrl . (strpos($baseUrl, '?') === false ? '?' : '&') . 'page=(:num)';
    }

    public function getTotalPages()
    {
        return ceil($this->totalItems / $this->itemsPerPage);
    }

    public function render()
    {
        $totalPages = $this->getTotalPages();
        if ($totalPages <= 1) {
            return '';
        }

        $html = '<nav aria-label="Navegação"><ul class="pagination justify-content-center">';

        // Botão Anterior
        $prevClass = ($this->currentPage <= 1) ? 'disabled' : '';
        $prevUrl = $this->getPageUrl($this->currentPage - 1);
        $html .= '<li class="page-item ' . $prevClass . '"><a class="page-link" href="' . $prevUrl . '">Anterior</a></li>';

        // Lógica para não mostrar 1000 botões, apenas um intervalo próximo ao atual
        $start = max(1, $this->currentPage - floor($this->maxPagesToShow / 2));
        $end = min($totalPages, $start + $this->maxPagesToShow - 1);

        if ($end - $start < $this->maxPagesToShow - 1) {
            $start = max(1, $end - $this->maxPagesToShow + 1);
        }

        if ($start > 1) {
             $html .= '<li class="page-item"><a class="page-link" href="' . $this->getPageUrl(1) . '">1</a></li>';
             if ($start > 2) {
                 $html .= '<li class="page-item disabled"><span class="page-link">...</span></li>';
             }
        }

        for ($i = $start; $i <= $end; $i++) {
            $active = ($this->currentPage == $i) ? 'active' : '';
            $html .= '<li class="page-item ' . $active . '"><a class="page-link" href="' . $this->getPageUrl($i) . '">' . $i . '</a></li>';
        }

        if ($end < $totalPages) {
            if ($end < $totalPages - 1) {
                $html .= '<li class="page-item disabled"><span class="page-link">...</span></li>';
            }
            $html .= '<li class="page-item"><a class="page-link" href="' . $this->getPageUrl($totalPages) . '">' . $totalPages . '</a></li>';
        }

        // Botão Próximo
        $nextClass = ($this->currentPage >= $totalPages) ? 'disabled' : '';
        $nextUrl = $this->getPageUrl($this->currentPage + 1);
        $html .= '<li class="page-item ' . $nextClass . '"><a class="page-link" href="' . $nextUrl . '">Próximo</a></li>';

        $html .= '</ul></nav>';

        return $html;
    }

    private function getPageUrl($pageNum)
    {
        // Preserva os parâmetros GET atuais (exceto 'page')
        $params = $_GET;
        $params['page'] = $pageNum;
        return '?' . http_build_query($params);
    }
}