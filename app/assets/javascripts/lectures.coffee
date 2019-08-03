# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.set_row_summary = (row) ->
  $header_ths = $('#lecture-table thead tr th')
  is_increment = $(row).hasClass('success')
  $(row).children().each((idx) ->
    if $(@).text() == '◯'
      th = $header_ths.get(idx)
      console.log(th)
      val = parseInt($(th).find('span').text(), 10)
      if is_increment
        $(th).find('span').text(val + 1)
      else
        $(th).find('span').text(val - 1)
  )


