FactoryBot.define do
  factory :word do
    name         { "english" }
    description  { "english" }
    category     { "単語" }
    user
  end
end