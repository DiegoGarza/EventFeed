json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :comment, :name, :event, :score, :created_at
end
