class PagesController < ApplicationController
  def foyer
    @username = current_user.username
    @familyroomplayers = Player.where(:room => "familyroom")
    @player = Player.all
  end
end
