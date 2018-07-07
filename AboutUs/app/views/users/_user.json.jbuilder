json.extract! user, :id, :user_id, :is_admin, :cart_id, :album_list[], :friend_list[], :email, :password, :first_name, :last_name, :created_at, :updated_at
json.url user_url(user, format: :json)
