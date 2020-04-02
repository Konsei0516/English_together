class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "room_channel", message_right: render_message_right(message), message_left: render_message_left(message)
  end

  private

  def render_message_right(message)
    ApplicationController.renderer.render partial: 'messages/message_right', locals: { message: message }
  end

  def render_message_left(message)
    ApplicationController.renderer.render partial: 'messages/message_left', locals: { message: message }
  end
end
