class RoomController < ApplicationController

  # before_filter :set_cache_buster

  def familyroom
    @messages = Message.all
    @famroomacroletters = Famroomacroletters.all
    @user = User.all
    @player = Player.create(:name => current_user.username, :room => "familyroom", :user_id => current_user.id)
    @playerlist = Player.where(:room => "familyroom")
    gon.playerlistcount = @playerlist.count
    @letterpool = ["A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D",
                  "E","E","E","E","E","F","F","F","F","G","G","G","G","H","H","H","H",
                  "I","I","I","I","J","K","K","L","L","L","L","M","M","M","M","N",
                  "N","N","N","O","O","O","P","P","P","P","Q","Q","R","R","R","S","S",
                  "S","S","T","T","T","T","U","U","V","V","W","W","X","Y","Y","Z",
                  "A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D",
                  "E","E","E","E","E","F","F","F","F","G","G","G","G","H","H","H","H",
                  "I","I","I","I","J","K","K","L","L","L","L","M","M","M","M","N",
                  "N","N","N","O","O","O","P","P","P","P","Q","Q","R","R","R","S","S",
                  "S","S","T","T","T","T","U","U","V","V","W","W","Y","Y","Z",
                  "A","A","A","A","B","B","B","B","C","C","C","C","D","D","D","D",
                  "E","E","E","E","E","F","F","F","F","G","G","G","G","H","H","H","H",
                  "I","I","I","I","J","L","L","L","L","M","M","M","M","N",
                  "N","N","N","O","O","O","P","P","P","P","Q","Q","R","R","R","S","S",
                  "S","S","T","T","T","T","U","U","V","V","W","W","Y","Y","Z"]
    @randomcategory = ["General", "Sports", "Food", "Movies", "Television", "History",
                      "Music", "Art", "Animals", "Science", "Government", "Fashion",
                      "Books", "Travel", "Celebrities", "Romance", "Technology",
                      "Family", "School", "Nature", "Health"]
    if Famroomacroletters.select("let3").first == nil
      Famroomacroletters.create(:let3 => @letterpool.sample(3).join,
                                :let4 => @letterpool.sample(4).join,
                                :let5 => @letterpool.sample(5).join,
                                :let6 => @letterpool.sample(6).join,
                                :let7 => @letterpool.sample(7).join)
      Famroomacroletters.create(:let3 => @letterpool.sample(3).join,
                                :let4 => @letterpool.sample(4).join,
                                :let5 => @letterpool.sample(5).join,
                                :let6 => @letterpool.sample(6).join,
                                :let7 => @letterpool.sample(7).join)
    end
    @round1letters = Famroomacroletters.find(:first).let3
    @round2letters = Famroomacroletters.find(:first).let4
    @round3letters = Famroomacroletters.find(:first).let5
    @round4letters = Famroomacroletters.find(:first).let6
    @round5letters = Famroomacroletters.find(:first).let7
    @round6letters = Famroomacroletters.find(:last).let3
    @round7letters = Famroomacroletters.find(:last).let4
    @round8letters = Famroomacroletters.find(:last).let5
    @round9letters = Famroomacroletters.find(:last).let6
    @round10letters = Famroomacroletters.find(:last).let7

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
