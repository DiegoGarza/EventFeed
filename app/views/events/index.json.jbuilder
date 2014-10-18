json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :name, :description, :twitter_username, :twitter_hashtag, :lat, :lng
  json.url event_url(event, format: :json)
end
