$filtersContainer = $ '#filters'
$filters = {
  Id: $filtersContainer.find('#filter-id')
  User: $filtersContainer.find('#filter-user')
  Host: $filtersContainer.find('#filter-host')
  db: $filtersContainer.find('#filter-db')
  Command: $filtersContainer.find('#filter-command')
  Time: $filtersContainer.find('#filter-time')
  State: $filtersContainer.find('#filter-state')
  Info: $filtersContainer.find('#filter-info')
}
getFilters = =>
  return {
    Id: $filters.Id.val()
    User: $filters.User.val()
    Host: $filters.Host.val()
    db: $filters.db.val()
    Command: $filters.Command.val()
    Time: $filters.Time.val()
    State: $filters.State.val()
    Info: $filters.Info.val()
  }

$table = $('#processlist-table')
$tbody = $table.find('tbody')
$count = $('#rows-count')
ss.event.on 'sendPl', (rows) ->
  filters = getFilters()
  html = ''
  rowCount = rows.length
  filterCount = 0
  for row in rows
    flag = true
    for key, val of row
      if filters[key]? and filters[key] isnt ''
        try
          regexp = new RegExp(filters[key])
          val ?= ''
          if val.match(regexp) is null
            flag = false
            break
          $filters[key].removeAttr('style')
        catch e
          $filters[key].css('border-color', '#B94A48')
          console.log e
    
    if flag
      # Example of using the Hogan Template in client/templates/chat/message.jade to generate HTML for each message
      html += ss.tmpl['processlist-processlist'].render row
      filterCount++

  # Append it to the #chatlog div and show effect
  $tbody.html('').html(html)
  $count.text 'count: ' + filterCount + ' / ' + rowCount

interval = 1000

requestShowProcesslist = ->
  ss.rpc 'showpl.sendPl', '', ->

intervalTimer = null;

setTimer = =>
  intervalTimer = setInterval(requestShowProcesslist, interval)

clearTimer = =>
  clearInterval intervalTimer

playing = true

$interval = $('#interval')
$interval.on 'change', (index, element) =>
  interval = parseInt($interval.val()) * 1000
  if playing
    clearTimer()
    setTimer()

setTimer()

$start = $('#start')
$stop = $('#stop')

$start.on 'click', =>
  clearTimer()
  setTimer()
  $start.attr 'disabled', 'disabled'
  $stop.removeAttr 'disabled'
  false

$stop.on 'click', =>
  clearTimer()
  $start.removeAttr 'disabled'
  $stop.attr 'disabled', 'disabled'
  false
