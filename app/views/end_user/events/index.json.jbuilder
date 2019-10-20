json.array!(@events) do |event|
  json.extract! event, :id,:title,:description,:fee,:address
  json.start event.start
  json.end event.end
  json.url end_user_event_url(event)
end
