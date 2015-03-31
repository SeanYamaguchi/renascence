json.array!(@posts_pictures) do |posts_picture|
  json.extract! posts_picture, :id, :picture
  json.url posts_picture_url(posts_picture, format: :json)
end
