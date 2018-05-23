json.array!(@userlevels) do |userlevel|
  json.extract! userlevel, :id, :level
  json.url userlevel_url(userlevel, format: :json)
end
