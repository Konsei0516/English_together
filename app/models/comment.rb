class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :word

  validates :text, presence: true
end
