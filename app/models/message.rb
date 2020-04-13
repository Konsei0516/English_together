class Message < ApplicationRecord
  belongs_to :user

  # 英語のみバリデーション
  VALID_MESSAGE_REGEX = /\A[0-9a-zA-Z]*\z/

  validates :content, presence: true,format:{ with: VALID_MESSAGE_REGEX }
  after_create_commit { MessageBroadcastJob.perform_later self }
end
