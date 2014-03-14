class PagesController < ApplicationController
  before_filter :authenticate_user!

  def foyer
    @username = current_user.username
    @familyroomplayers = Player.where(:room => "familyroom")
    @player = Player.all
    Player.delete_all(["name = ?", current_user.username])
    @points_alltime = @current_user.points_alltime
    @winninganswers = Winninganswer.all
    @gamesplayed = @current_user.gamesplayed
    @gameswon = @current_user.gameswon
  end
end
