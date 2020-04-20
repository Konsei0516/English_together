FactoryBot.define do
  factory :comment do
    text { 'これを待ってた' }
    user
    word
  end
end