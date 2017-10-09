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
          var url = `/books/${row.id}`
          return `<a href=${url}>${data}</a>`
        }
      },
      { 'data': 'author' },
      { 'data': 'first_published' }
    ],
    'initComplete': function (settings, json) {
      $('#books-table_filter input').unbind()
      $('#books-table_filter input').bind('keyup', function (e) {
        if (e.keyCode == 13) {
          table.search(this.value).draw()
        }
      })
    },
    'destroy': true
  });

  $('#books-table tbody').on('click', 'tr', function () {
    if ($(this).hasClass('selected')) {
      $(this).removeClass('selected')
    } else {
      table.$('tr.selected').removeClass('selected')
      $(this).addClass('selected')
    }
  });

  $('#book-first-published').datepicker({
    format: 'dd/mm/yyyy'
  });

  $('#btn-edit-book').click(function () {
    if (table.rows('.selected').data().length < 1) {
      BootstrapDialog.show({
        title: 'Warning',
        message: 'You must select a row!'
      })
    } else {
      var id = table.rows('.selected').data()[0].id;
      location.href = `/books/${id}/edit`;
    }
  });

  $('#btn-delete-book').click(function () {
    if (table.rows('.selected').data().length < 1) {
      BootstrapDialog.show({
        title: 'Warning',
        message: 'You must select a row!'
      })
    } else {
      var selected_book = table.rows('.selected').data()[0];
      BootstrapDialog.confirm(`Do you want to delete ${selected_book.title}?`, function (result) {
        if (result) {
          $.ajax({
            url: `/books/${selected_book.id}`,
            type: 'POST',
            method: 'DELETE',
            success: function (result)
            {
              if (result.success)
              {
                table.ajax.reload();
              }  
            }  
          });
        }
      });
    }
  });
})
