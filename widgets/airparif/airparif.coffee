class Dashing.Airparif extends Dashing.Widget

  onData: (data) ->
    # Update image
    $(@node).find('img').attr('src', data.image)

    # Update index color
    $(@node).find('#todayIndex').removeClass().addClass(@classFor(data.jour))
    $(@node).find('#tomorrowIndex').removeClass().addClass(@classFor(data.demain))

    tomorrowLine = $(@node).find('.tomorrowLine')
    if data.demain == null && tomorrowLine.is(':visible')
      tomorrowLine.hide()
    else if data.demain != null && tomorrowLine.is(':hidden')
      tomorrowLine.show()

  classFor: (value) ->
    if      value >= 0  && value < 25  then return 'vlow'
    else if value >= 25 && value < 50  then return 'low'
    else if value >= 50 && value < 75  then return 'medium'
    else if value >= 75 && value < 100 then return 'high'
    else if value >= 100               then return 'vhigh'
