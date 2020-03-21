class Like < ApplicationRecord
  belongs_to :user
  belongs_to :word, counter_cache: :likes_count
end
