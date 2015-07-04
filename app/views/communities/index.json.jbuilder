json.array!(@communities) do |community|
  json.extract! community, :id, :name, :email, :summary, :purpose, :user_id
  json.url community_url(community, format: :json)
end
