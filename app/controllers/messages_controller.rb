class MessagesController < ApplicationController

  def familyroom

  end

  def create
    @message = Message.create!(params[:message])
    PrivatePub.publish_to("/messages/familyroom", message: @message)
  end
end
