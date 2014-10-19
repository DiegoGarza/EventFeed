json.array!(@events) do |event|
  json.extract! event, :id, :user_id, :name, :description, :twitter_username, :twitter_hashtag, :latitude, :longitude
  json.url event_url(event, format: :json)
end
