// public/js/datatables.js

$(document).ready(function () {
  $('#dataTable').DataTable({
    // Configurações de idioma para Português
    "language": {
      "sEmptyTable": "Nenhum registro encontrado",
      "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
      "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
      "sInfoFiltered": "(Filtrados de _MAX_ registros)",
      "sInfoPostFix": "",
      "sInfoThousands": ".",
      "sLengthMenu": "_MENU_ resultados por página",
      "sLoadingRecords": "Carregando...",
      "sProcessing": "Processando...",
      "sZeroRecords": "Nenhum registro encontrado",
      "sSearch": "Pesquisar",
      "oPaginate": {
        "sNext": "Próximo",
        "sPrevious": "Anterior",
        "sFirst": "Primeiro",
        "sLast": "Último"
      },
      "oAria": {
        "sSortAscending": ": Ordenar colunas de forma ascendente",
        "sSortDescending": ": Ordenar colunas de forma descendente"
      }
    },

    // --- CORREÇÃO PRINCIPAL AQUI ---
    // "order": [] informa ao DataTables para NÃO aplicar ordenação inicial.
    // Assim, ele respeita a ordem que veio do PHP (Data de Registro DESC).
    "order": [0, 'desc'],

    "ordering": true,

    // Desabilitamos a paginação e a pesquisa do JS pois você já implementou
    // isso no PHP (Select de Limite e Campo de Busca no topo).
    // Isso evita confusão (ex: o PHP traz 10 itens e o JS tenta paginar esses 10).
    "paging": false,
    "searching": false,
    "info": false
  });
});