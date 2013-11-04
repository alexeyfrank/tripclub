json.array! @events do |event|
  json.title event.title
  json.description event.description
  json.date event.date.to_time.strftime("%Y-%m-%d %H:%M") #.to_time.to_i
  json.url event_path(event)
end
