class RoomController < ApplicationController

  def familyroom
    @messages = Message.all
    @user = User.all
  end

  def sauna
  end

end
