json.array!(@posts_videos) do |posts_video|
  json.extract! posts_video, :id, :video
  json.url posts_video_url(posts_video, format: :json)
end
