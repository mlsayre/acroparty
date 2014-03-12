class PagesController < ApplicationController
  def foyer
    @username = current_user.username
    @familyroomplayers = Player.where(:room => "familyroom")
    @player = Player.all
    Player.delete_all(["name = ?", current_user.username])
    @points_alltime = @current_user.points_alltime
    @winninganswers = Winninganswer.all
  end
end
