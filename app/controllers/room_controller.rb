class RoomController < ApplicationController
  def FamilyRoom
    @messages = Message.all
  end

  def Sauna
  end

  def create
    @message = Message.create!(params[:message])
  end

end
