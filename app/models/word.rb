class Word < ApplicationRecord
  acts_as_taggable

  VALID_WORD_NAME_REGEX = /\A[0-9a-zA-Z]*\z/
  
  validates :name, presence: true,format: { with: VALID_WORD_NAME_REGEX}
  validates :description, presence: true
  validates :category, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def self.search(input)
    return nil if input == ""
    Word.where(['name LIKE ?', "%#{input}%"] ).limit(10)
  end


  scope :recent, ->{order(created_at: :desc)}
end
