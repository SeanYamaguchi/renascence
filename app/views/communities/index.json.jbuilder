json.array!(@communities) do |community|
  json.extract! community, :id, :name, :logo, :email, :purpose, :activity, :locked, :end_date, :leader
  json.url community_url(community, format: :json)
end
