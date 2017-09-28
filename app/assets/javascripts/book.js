$(document).ready(function () {
  var table = $('#books-table').DataTable({
    'processing': true,
    'serverSide': true,
    'ajax': $('#books-table').data('source'),
    'pagingType': 'full_numbers',
    'columns': [
      { 'data': 'id' },
      {
        'data': 'title',
        'render': function (data, type, row, meta) {
          var url = `/books/${row.id}`;
          return `<a href=${url}>${data}</a>`;
        }
      },
      { 'data': 'author' },
      { 'data': 'first_published' }
    ],
    'initComplete': function (settings, json) {
      $('#books-table_filter input').unbind();
      $('#books-table_filter input').bind('keyup', function (e) {
        if (e.keyCode == 13) {
          table.search(this.value).draw();
        }
      });
    }
  });

  $('#books-table tbody').on('click', 'tr', function ()
  {
    if ($(this).hasClass('selected'))
    {
      $(this).removeClass('selected');
    } else
    {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
    }
  });
})
