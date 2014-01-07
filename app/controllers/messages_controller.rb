class MessagesController < ApplicationController

  def familyroom
    @messages = Message.all
  end

  def create
    @message = Message.create!(params[:message])
  end
end
