class RoomController < ApplicationController

  def familyroom
    @messages = Message.all
    @user = User.all
    @player = Player.create(:name => current_user.username, :room => "familyroom")
    @playerlist = Player.where(:room => "familyroom")

  end

  def destroyplayer
    @player = Player.find(:name => current_user.username && :room => "familyroom")
    @player.destroyplayer
  end

  def sauna
  end

end
