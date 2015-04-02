json.array!(@admin_users_mailmagazines) do |admin_users_mailmagazine|
  json.extract! admin_users_mailmagazine, :id, :title, :body
  json.url admin_users_mailmagazine_url(admin_users_mailmagazine, format: :json)
end
