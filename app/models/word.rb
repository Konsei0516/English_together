class Word < ApplicationRecord
  acts_as_taggable

  scope :get_by_category, ->(category) {
    where(category: category)
  }

  #バリデーション
  VALID_WORD_NAME_REGEX = /\A[\w` -]*[A-Za-z][\w` -]*\z/
  validates :name, presence: true,format: { with: VALID_WORD_NAME_REGEX}
  validates :description, presence: true
  validates :category, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :comments,dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  # 検索
  def self.search(input)
    Word.where(['name LIKE ?', "%#{input}%"] ).limit(10)
  end


  scope :recent, ->{order(created_at: :desc)}
end
