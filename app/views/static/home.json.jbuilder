json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :comment
end