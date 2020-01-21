class MessagesController < ApplicationController

  def create
    @message = Message.new
    @message.save
    render template: "rooms/show"
  end
end
