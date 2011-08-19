$(function() {
  $('table').dataTable()
  $("button").overlay({mask: '#000', fixed: false})
  
  $('input:file').change(function(e) {
    e.target.form.submit()
  })
})