class RoomController < ApplicationController

  # before_filter :set_cache_buster

  def familyroom
    @messages = Message.all
    @famroomacroletters = Famroomacroletters.all
    @famroomgamestate = Famroomgamestate.all
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

    if @playerlist.count < 2 && Famroomgamestate.find(:first).activity != "waiting"
      Famroomgamestate.create(:activity => "waiting")
      Famroomacroletters.destroy_all
    elsif @playerlist.count < 2
      Famroomroundtime.destroy_all
    elsif @playerlist.count >= 2 && Famroomroundtime.select("r1write").first == nil
      Famroomroundtime.create(:newgamestarts => DateTime.now.utc + 2.seconds,
                             :r1prep => DateTime.now.utc + 10.seconds,
                             :r1write => DateTime.now.utc + 25.seconds,
                             :r1vote => DateTime.now.utc + 95.seconds,
                             :r1res => DateTime.now.utc + 125.seconds,
                             :r2prep => DateTime.now.utc + 140.seconds,
                             :r2write => DateTime.now.utc + 155.seconds,
                             :r2vote => DateTime.now.utc + 225.seconds,
                             :r2res => DateTime.now.utc + 255.seconds,
                             :r3prep => DateTime.now.utc + 270.seconds,
                             :r3write => DateTime.now.utc + 285.seconds,
                             :r3vote => DateTime.now.utc + 355.seconds,
                             :r3res => DateTime.now.utc + 385.seconds,
                             :r4prep => DateTime.now.utc + 400.seconds,
                             :r4write => DateTime.now.utc + 415.seconds,
                             :r4vote => DateTime.now.utc + 485.seconds,
                             :r4res => DateTime.now.utc + 515.seconds,
                             :r5prep => DateTime.now.utc + 530.seconds,
                             :r5write => DateTime.now.utc + 545.seconds,
                             :r5vote => DateTime.now.utc + 615.seconds,
                             :r5res => DateTime.now.utc + 645.seconds,
                             :r6prep => DateTime.now.utc + 660.seconds,
                             :r6write => DateTime.now.utc + 675.seconds,
                             :r6vote => DateTime.now.utc + 745.seconds,
                             :r6res => DateTime.now.utc + 775.seconds,
                             :r7prep => DateTime.now.utc + 790.seconds,
                             :r7write => DateTime.now.utc + 805.seconds,
                             :r7vote => DateTime.now.utc + 875.seconds,
                             :r7res => DateTime.now.utc + 905.seconds,
                             :r8prep => DateTime.now.utc + 920.seconds,
                             :r8write => DateTime.now.utc + 935.seconds,
                             :r8vote => DateTime.now.utc + 1005.seconds,
                             :r8res => DateTime.now.utc + 1035.seconds,
                             :r9prep => DateTime.now.utc + 1050.seconds,
                             :r9write => DateTime.now.utc + 1065.seconds,
                             :r9vote => DateTime.now.utc + 1135.seconds,
                             :r9res => DateTime.now.utc + 1165.seconds,
                             :r10prep => DateTime.now.utc + 1180.seconds,
                             :r10write => DateTime.now.utc + 1195.seconds,
                             :r10vote => DateTime.now.utc + 1265.seconds,
                             :r10res => DateTime.now.utc + 1295.seconds,
                             :finalresults => DateTime.now.utc + 1310.seconds)
    end

  @timer1prep = Famroomroundtime.find(:first).r1prep
  @timer1write = Famroomroundtime.find(:first).r1write
  @timer1vote = Famroomroundtime.find(:first).r1vote
  @timer1res = Famroomroundtime.find(:first).r1res
  @timer2prep = Famroomroundtime.find(:first).r2prep
  @timer2write = Famroomroundtime.find(:first).r2write
  @timer2vote = Famroomroundtime.find(:first).r2vote
  @timer2res = Famroomroundtime.find(:first).r2res
  @timer3prep = Famroomroundtime.find(:first).r3prep
  @timer3write = Famroomroundtime.find(:first).r3write
  @timer3vote = Famroomroundtime.find(:first).r3vote
  @timer3res = Famroomroundtime.find(:first).r3res
  @timer4prep = Famroomroundtime.find(:first).r4prep
  @timer4write = Famroomroundtime.find(:first).r4write
  @timer4vote = Famroomroundtime.find(:first).r4vote
  @timer4res = Famroomroundtime.find(:first).r4res
  @timer5prep = Famroomroundtime.find(:first).r5prep
  @timer5write = Famroomroundtime.find(:first).r5write
  @timer5vote = Famroomroundtime.find(:first).r5vote
  @timer5res = Famroomroundtime.find(:first).r5res
  @timer6prep = Famroomroundtime.find(:first).r6prep
  @timer6write = Famroomroundtime.find(:first).r6write
  @timer6vote = Famroomroundtime.find(:first).r6vote
  @timer6res = Famroomroundtime.find(:first).r6res
  @timer7prep = Famroomroundtime.find(:first).r7prep
  @timer7write = Famroomroundtime.find(:first).r7write
  @timer7vote = Famroomroundtime.find(:first).r7vote
  @timer7res = Famroomroundtime.find(:first).r7res
  @timer8prep = Famroomroundtime.find(:first).r8prep
  @timer8write = Famroomroundtime.find(:first).r8write
  @timer8vote = Famroomroundtime.find(:first).r8vote
  @timer8res = Famroomroundtime.find(:first).r8res
  @timer9prep = Famroomroundtime.find(:first).r9prep
  @timer9write = Famroomroundtime.find(:first).r9write
  @timer9vote = Famroomroundtime.find(:first).r9vote
  @timer9res = Famroomroundtime.find(:first).r9res
  @timer10prep = Famroomroundtime.find(:first).r10prep
  @timer10write = Famroomroundtime.find(:first).r10write
  @timer10vote = Famroomroundtime.find(:first).r10vote
  @timer10res = Famroomroundtime.find(:first).r10res
  @timernewgamestarts = Famroomroundtime.find(:first).newgamestarts
  @timerfinalresults = Famroomroundtime.find(:first).finalresults

  end

  def destroyplayer
    @famroomplayerlist = Player.where(:room => "familyroom")
    Player.delete_all(["name = ? AND room = ?", current_user.username, 'familyroom'])

    if @famroomplayerlist.count < 2
      Famroomroundtime.destroy_all
    end

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
