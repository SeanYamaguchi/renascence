json.array!(@pictures) do |picture|
  json.extract! picture, :id, :picture
  json.url picture_url(picture, format: :json)
end
