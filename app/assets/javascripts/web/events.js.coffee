(($) ->
  $ ->
    $('#events_calendar').eventCalendar
      eventsjson: Routes.api_v1_events_path()
      jsonDateFormat: 'human'


)(jQuery)
