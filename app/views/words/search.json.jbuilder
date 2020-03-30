json.array! @words do |word|
  json.id word.id
  json.name word.name
  json.user_id word.user_id
  json.username word.user.name
end