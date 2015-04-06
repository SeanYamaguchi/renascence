json.array!(@users_user_profiles_avatars) do |users_user_profiles_avatar|
  json.extract! users_user_profiles_avatar, :id, :avatar, :remove_avatar, :avatar_cache, :user_id
  json.url users_user_profiles_avatar_url(users_user_profiles_avatar, format: :json)
end
