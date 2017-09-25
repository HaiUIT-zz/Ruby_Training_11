# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#books-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#books-table').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'id'}
      {data: 'title'}
      {data: 'author'},
      {data: 'first_published'}
    ]