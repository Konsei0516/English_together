class Word < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  scope :recent, ->{order(created_at: :desc)}
end
