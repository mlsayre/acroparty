class RoomController < ApplicationController
  def familyroom
    @messages = Message.all
  end

  def sauna
  end



end
