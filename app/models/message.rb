class Message < ApplicationRecord
  belongs_to :user

  # 英語のみバリデーション
  VALID_MESSAGE_REGEX =  /\A[\w` -]*[A-Za-z][\w` -]*\z/
  

  validates :content, presence: true,format:{ with: VALID_MESSAGE_REGEX }
  after_create_commit { MessageBroadcastJob.perform_later self }
end
