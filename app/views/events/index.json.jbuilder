json.array!(@events) do |event|
  json.extract! event, :id, :name, :description
  json.title event.name
  json.start event.date
  json.end event.date
  json.url event_url(event, format: :html)
end
