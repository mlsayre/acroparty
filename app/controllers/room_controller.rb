class RoomController < ApplicationController

  # before_filter :set_cache_buster

  def familyroom
    @messages = Message.all
    @user = User.all
    @player = Player.create(:name => current_user.username, :room => "familyroom", :user_id => current_user.id)
    @playerlist = Player.where(:room => "familyroom")

  end

  def destroyplayer
    Player.delete_all(["name = ? AND room = ?", current_user.username, 'familyroom'])
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Game ended.' }
      format.json { head :no_content }
    end
  end

  def sauna
  end

  # def set_cache_buster
  #   response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  #   response.headers["Pragma"] = "no-cache"
  #   response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  # end

end
