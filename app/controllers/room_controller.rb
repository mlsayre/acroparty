class RoomController < ApplicationController

  before_filter :authenticate_user!
  before_filter :round_timings, only: [:familyroom]

  def familyroom
    @messages = Message.all
    @famroomacroletters = Famroomacroletters.all
    Famroomacroletters.createletters
    Famroomcat.createcats
    @famroomgamestate = Famroomgamestate.all
    @user = User.all
    @gp = User.where('id = ?', current_user.id).first.gamepoints
    @player = Player.create(:name => current_user.username, :room => "familyroom",
      :user_id => current_user.id, :gamepoints => current_user.gamepoints)
    @playerlist = Player.where(:room => "familyroom")
    # gon.playerlistcount = @playerlist.count
    @famroomanswers = Famroomanswer.all
    if @playerlist.count > 12
      redirect_to foyer_path
      flash[:notice] = "The room has maximum players. We may need to call the fire marshall.
                        Try again soon."
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

    @round1cat = Famroomcat.find(:first).r1cat
    @round2cat = Famroomcat.find(:first).r2cat
    @round3cat = Famroomcat.find(:first).r3cat
    @round4cat = Famroomcat.find(:first).r4cat
    @round5cat = Famroomcat.find(:first).r5cat
    @round6cat = Famroomcat.find(:first).r6cat
    @round7cat = Famroomcat.find(:first).r7cat
    @round8cat = Famroomcat.find(:first).r8cat
    @round9cat = Famroomcat.find(:first).r9cat
    @round10cat = Famroomcat.find(:first).r10cat

    roundTimeArray = [@newgamestartstime, @r1preptime, @r1writetime, @r1votetime, @r1restime,
                      @r2preptime, @r2writetime, @r2votetime, @r2restime,
                      @r3preptime, @r3writetime, @r3votetime, @r3restime,
                      @r4preptime, @r4writetime, @r4votetime, @r4restime,
                      @r5preptime, @r5writetime, @r5votetime, @r5restime,
                      @r6preptime, @r6writetime, @r6votetime, @r6restime,
                      @r7preptime, @r7writetime, @r7votetime, @r7restime,
                      @r8preptime, @r8writetime, @r8votetime, @r8restime,
                      @r9preptime, @r9writetime, @r9votetime, @r9restime,
                      @r10preptime, @r10writetime, @r10votetime, @r10restime,
                      @finalresultstime]

    if @playerlist.count < 3
      Famroomacroletters.destroy_all
      Famroomroundtime.destroy_all
      Famroomcat.destroy_all
      eventArray = []

    elsif @playerlist.count > 2 && Famroomroundtime.select("r1write").first == nil
      Famroomroundtime.create(:newgamestarts => DateTime.now.utc + 5.seconds,
         :r1prep => DateTime.now.utc + roundTimeArray.take(1).sum.seconds + 5.seconds,
         :r1write => DateTime.now.utc + roundTimeArray.take(2).sum.seconds + 5.seconds,
         :r1vote => DateTime.now.utc + roundTimeArray.take(3).sum.seconds + 5.seconds,
         :r1res => DateTime.now.utc + roundTimeArray.take(4).sum.seconds + 5.seconds,
         :r2prep => DateTime.now.utc + roundTimeArray.take(5).sum.seconds + 5.seconds,
         :r2write => DateTime.now.utc + roundTimeArray.take(6).sum.seconds + 5.seconds,
         :r2vote => DateTime.now.utc + roundTimeArray.take(7).sum.seconds + 5.seconds,
         :r2res => DateTime.now.utc + roundTimeArray.take(8).sum.seconds + 5.seconds,
         :r3prep => DateTime.now.utc + roundTimeArray.take(9).sum.seconds + 5.seconds,
         :r3write => DateTime.now.utc + roundTimeArray.take(10).sum.seconds + 5.seconds,
         :r3vote => DateTime.now.utc + roundTimeArray.take(11).sum.seconds + 5.seconds,
         :r3res => DateTime.now.utc + roundTimeArray.take(12).sum.seconds + 5.seconds,
         :r4prep => DateTime.now.utc + roundTimeArray.take(13).sum.seconds + 5.seconds,
         :r4write => DateTime.now.utc + roundTimeArray.take(14).sum.seconds + 5.seconds,
         :r4vote => DateTime.now.utc + roundTimeArray.take(15).sum.seconds + 5.seconds,
         :r4res => DateTime.now.utc + roundTimeArray.take(16).sum.seconds + 5.seconds,
         :r5prep => DateTime.now.utc + roundTimeArray.take(17).sum.seconds + 5.seconds,
         :r5write => DateTime.now.utc + roundTimeArray.take(18).sum.seconds + 5.seconds,
         :r5vote => DateTime.now.utc + roundTimeArray.take(19).sum.seconds + 5.seconds,
         :r5res => DateTime.now.utc + roundTimeArray.take(20).sum.seconds + 5.seconds,
         :r6prep => DateTime.now.utc + roundTimeArray.take(21).sum.seconds + 5.seconds,
         :r6write => DateTime.now.utc + roundTimeArray.take(22).sum.seconds + 5.seconds,
         :r6vote => DateTime.now.utc + roundTimeArray.take(23).sum.seconds + 5.seconds,
         :r6res => DateTime.now.utc + roundTimeArray.take(24).sum.seconds + 5.seconds,
         :r7prep => DateTime.now.utc + roundTimeArray.take(25).sum.seconds + 5.seconds,
         :r7write => DateTime.now.utc + roundTimeArray.take(26).sum.seconds + 5.seconds,
         :r7vote => DateTime.now.utc + roundTimeArray.take(27).sum.seconds + 5.seconds,
         :r7res => DateTime.now.utc + roundTimeArray.take(28).sum.seconds + 5.seconds,
         :r8prep => DateTime.now.utc + roundTimeArray.take(29).sum.seconds + 5.seconds,
         :r8write => DateTime.now.utc + roundTimeArray.take(30).sum.seconds + 5.seconds,
         :r8vote => DateTime.now.utc + roundTimeArray.take(31).sum.seconds + 5.seconds,
         :r8res => DateTime.now.utc + roundTimeArray.take(32).sum.seconds + 5.seconds,
         :r9prep => DateTime.now.utc + roundTimeArray.take(33).sum.seconds + 5.seconds,
         :r9write => DateTime.now.utc + roundTimeArray.take(34).sum.seconds + 5.seconds,
         :r9vote => DateTime.now.utc + roundTimeArray.take(35).sum.seconds + 5.seconds,
         :r9res => DateTime.now.utc + roundTimeArray.take(36).sum.seconds + 5.seconds,
         :r10prep => DateTime.now.utc + roundTimeArray.take(37).sum.seconds + 5.seconds,
         :r10write => DateTime.now.utc + roundTimeArray.take(38).sum.seconds + 5.seconds,
         :r10vote => DateTime.now.utc + roundTimeArray.take(39).sum.seconds + 5.seconds,
         :r10res => DateTime.now.utc + roundTimeArray.take(40).sum.seconds + 5.seconds,
         :finalresults => DateTime.now.utc + roundTimeArray.take(41).sum.seconds + 5.seconds)

    end

    if @playerlist.count > 2
      @timernewgamestarts = Famroomroundtime.find(:first).newgamestarts.utc
      @timer1prep = Famroomroundtime.find(:first).r1prep.utc
      @timer1write = Famroomroundtime.find(:first).r1write.utc
      @timer1vote = Famroomroundtime.find(:first).r1vote.utc
      @timer1res = Famroomroundtime.find(:first).r1res.utc
      @timer2prep = Famroomroundtime.find(:first).r2prep.utc
      @timer2write = Famroomroundtime.find(:first).r2write.utc
      @timer2vote = Famroomroundtime.find(:first).r2vote.utc
      @timer2res = Famroomroundtime.find(:first).r2res.utc
      @timer3prep = Famroomroundtime.find(:first).r3prep.utc
      @timer3write = Famroomroundtime.find(:first).r3write.utc
      @timer3vote = Famroomroundtime.find(:first).r3vote.utc
      @timer3res = Famroomroundtime.find(:first).r3res.utc
      @timer4prep = Famroomroundtime.find(:first).r4prep.utc
      @timer4write = Famroomroundtime.find(:first).r4write.utc
      @timer4vote = Famroomroundtime.find(:first).r4vote.utc
      @timer4res = Famroomroundtime.find(:first).r4res.utc
      @timer5prep = Famroomroundtime.find(:first).r5prep.utc
      @timer5write = Famroomroundtime.find(:first).r5write.utc
      @timer5vote = Famroomroundtime.find(:first).r5vote.utc
      @timer5res = Famroomroundtime.find(:first).r5res.utc
      @timer6prep = Famroomroundtime.find(:first).r6prep.utc
      @timer6write = Famroomroundtime.find(:first).r6write.utc
      @timer6vote = Famroomroundtime.find(:first).r6vote.utc
      @timer6res = Famroomroundtime.find(:first).r6res.utc
      @timer7prep = Famroomroundtime.find(:first).r7prep.utc
      @timer7write = Famroomroundtime.find(:first).r7write.utc
      @timer7vote = Famroomroundtime.find(:first).r7vote.utc
      @timer7res = Famroomroundtime.find(:first).r7res.utc
      @timer8prep = Famroomroundtime.find(:first).r8prep.utc
      @timer8write = Famroomroundtime.find(:first).r8write.utc
      @timer8vote = Famroomroundtime.find(:first).r8vote.utc
      @timer8res = Famroomroundtime.find(:first).r8res.utc
      @timer9prep = Famroomroundtime.find(:first).r9prep.utc
      @timer9write = Famroomroundtime.find(:first).r9write.utc
      @timer9vote = Famroomroundtime.find(:first).r9vote.utc
      @timer9res = Famroomroundtime.find(:first).r9res.utc
      @timer10prep = Famroomroundtime.find(:first).r10prep.utc
      @timer10write = Famroomroundtime.find(:first).r10write.utc
      @timer10vote = Famroomroundtime.find(:first).r10vote.utc
      @timer10res = Famroomroundtime.find(:first).r10res.utc
      @timerfinalresults = Famroomroundtime.find(:first).finalresults.utc

      eventArray = [@timernewgamestarts,
                    @timer1prep, @timer1write, @timer1vote, @timer1res,
                    @timer2prep, @timer2write, @timer2vote, @timer2res,
                    @timer3prep, @timer3write, @timer3vote, @timer3res,
                    @timer4prep, @timer4write, @timer4vote, @timer4res,
                    @timer5prep, @timer5write, @timer5vote, @timer5res,
                    @timer6prep, @timer6write, @timer6vote, @timer6res,
                    @timer7prep, @timer7write, @timer7vote, @timer7res,
                    @timer8prep, @timer8write, @timer8vote, @timer8res,
                    @timer9prep, @timer9write, @timer9vote, @timer9res,
                    @timer10prep, @timer10write, @timer10vote, @timer10res,
                    @timerfinalresults]

      @nextround = eventArray.bsearch {|x| x > DateTime.now.utc }
      @timetonextround = @nextround.change(:usec => 0) - DateTime.now
                         .utc.change(:usec => 0)

      if @timerfinalresults < DateTime.now.utc
        Famroomacroletters.destroy_all
        Famroomroundtime.destroy_all
        Famroomcat.destroy_all
        eventArray = []
        redirect_to foyer_path
        flash[:notice] = "The room had a weird smell. We lit some candles.
                         Please try again. :)"
      end

      jsRoundFunctionArray = ["newGameStarts",
                              "r1prep", "r1write", "r1vote", "r1res",
                              "r2prep", "r2write", "r2vote", "r2res",
                              "r3prep", "r3write", "r3vote", "r3res",
                              "r4prep", "r4write", "r4vote", "r4res",
                              "r5prep", "r5write", "r5vote", "r5res",
                              "r6prep", "r6write", "r6vote", "r6res",
                              "r7prep", "r7write", "r7vote", "r7res",
                              "r8prep", "r8write", "r8vote", "r8res",
                              "r9prep", "r9write", "r9vote", "r9res",
                              "r10prep", "r10write", "r10vote", "r10res",
                              "finalResults"]
    end

    if Famroomanswer.where(user_id: current_user.id).find(:last)
      @submissiontime = Famroomanswer.where(user_id: current_user.id)
                        .find(:last).answertime
    else
      @submissiontime = 30.00
    end

    if @playerlist.count >= 3
      eventArray.zip(jsRoundFunctionArray).each do |roundtime, function|
        if @nextround == roundtime
          @timetojoin = roundtime.change(:usec => 0) -
                        DateTime.now.utc.change(:usec => 0)
          @roundtojoin = function
        end
      end
    elsif @playerlist.count < 3
      @roundtojoin = "waitingForPlayers"
      @timetojoin = 2
    end

    # only one answer per user
    if Famroomanswer.where(:user_id => current_user.id).count > 1
      newestuseranswer = Famroomanswer.where(:user_id => current_user.id)
                                      .find(:last)
      Famroomanswer.where('created_at < ? AND user_id = ?', newestuseranswer
                   .created_at, current_user.id).delete_all
    end

    # the player with the most votes at the end of the round
    if Famroomanswer.all == []
      @roundwinner = User.where(username: "none").first
    elsif Famroomanswer.all != []
      @roundwinner = Famroomanswer.order('points DESC, created_at ASC')
                     .first.user
      @roundwinneranswer = Famroomanswer.order('points DESC, created_at ASC')
                     .first.id
    end

    # the player with the fastest answer receiving a vote
    if Famroomanswer.all == [] || Famroomanswer.where('points > ?', 0)
       .all == []
      @fastestanswer = User.where(username: "none").first
    else
      @fastestanswer = Famroomanswer.where('points > ?', 0)
                       .order('created_at ASC').first.user
    end

    @winninganswervoters = User.where('answervotedfor = ?', @roundwinneranswer)

    # @nonvoters = User.where('answervotedfor = ?', nil)


    # don't show vote button for player's answer
    if Famroomanswer.all == [] || Famroomanswer.where("user_id = ?", current_user.id) == []
      @noownvote = "..."
    elsif Famroomanswer.where("user_id = ?", current_user.id) != []
      @noownvote = Famroomanswer.where("user_id = ?", current_user.id).first.answer
    else
      @noownvote = "..."
    end

    if Famroomanswer.all == [] || Famroomanswer.where("user_id = ?", current_user.id) == []
      @famroomanswersminusplayer = @famroomanswers
    elsif Famroomanswer.where("user_id = ?", current_user.id) != []
      @famroomanswersminusplayer = Famroomanswer.where("user_id != ?", current_user.id).all
    else
      @famroomanswersminusplayer = @famroomanswers
    end

    # show bonus points in results
    if Famroomanswer.all != []
      if Famroomanswer.first.round == 1 ||
        Famroomanswer.first.round == 6
        @bonuspointsshow = 3
      elsif Famroomanswer.first.round == 2 ||
        Famroomanswer.first.round == 7
        @bonuspointsshow = 4
      elsif Famroomanswer.first.round == 3 ||
        Famroomanswer.first.round == 8
        @bonuspointsshow = 5
      elsif Famroomanswer.first.round == 4 ||
        Famroomanswer.first.round == 9
        @bonuspointsshow = 6
      elsif Famroomanswer.first.round == 5 ||
        Famroomanswer.first.round == 10
        @bonuspointsshow = 7
      else
        @bonuspointsshow = 0
      end
    end

    @gamewinner = User.joins(:player).where('room = ?', 'familyroom')
                      .order('users.gamepoints DESC').first
    if Winninganswer.where('user_id = ?', current_user.id) != []
      @tweetacroletters = Winninganswer.where('user_id = ?', current_user.id)
                                       .last.acroletters
      @tweetcat = Winninganswer.where('user_id = ?', current_user.id)
                               .last.category
      @tweetanswer = Winninganswer.where('user_id = ?', current_user.id)
                                  .last.answer
    else
      @tweetacroletters = "ABCDEF"
      @tweetcat = "Category"
      @tweetanswer = "Answer"
    end

  end

  def playerenterinit
    current_user.update_attributes(:answervotedfor => nil, :gamepoints => 0)
    Player.where('user_id = ?', current_user.id).first
          .update_attributes(:gamepoints => 0)

    render :nothing => true
  end

  def roundprep
    Famroomanswer.destroy_all
    User.where('id = ?', current_user.id).first
        .update_attributes(:answervotedfor => nil)
    render :nothing => true
  end

  def famroomanswercreate
    Famroomanswer.create!(params[:famroomanswer])
    render :nothing => true
  end

  def updategamepoints
    # update fastestanswer points
    if Famroomanswer.where('points > ?', 0).order('created_at ASC')
                    .first != nil && Famroomanswer.where('points > ?', 0).order('created_at ASC')
                    .first.user.id == current_user.id
      @fastestanswer = Famroomanswer.where('points > ?', 0)
                       .order('created_at ASC').first
      if User.where('id = ?', current_user.id).first.answervotedfor != nil
        @fastestanswer.user.increment!(:gamepoints, by = 2)
        @fastestanswer.user.increment!(:points_alltime, by = 2)
      end
    end

    # update voted for winner points
    @roundwinneranswer = Famroomanswer.order('points DESC, created_at ASC')
                     .first.id
    if User.where('answervotedfor = ? AND id = ?', @roundwinneranswer, current_user.id)
       .first != nil
      @winninganswervoters = User.where('answervotedfor = ? AND id = ?', @roundwinneranswer, current_user.id).first
      @winninganswervoters.increment!(:gamepoints, by = 1)
      @winninganswervoters.increment!(:points_alltime, by = 1)
    end

    # update vote points
    if Famroomanswer.where('user_id = ?', current_user.id) != []
      @roundpointstoadd = Famroomanswer.where('user_id = ?', current_user.id).first.points
    else
      @roundpointstoadd = 0
    end
    if User.where('id = ?', current_user.id).first.answervotedfor != nil
      User.where('id = ?', current_user.id).first.increment!(:gamepoints, by = @roundpointstoadd)
      User.where('id = ?', current_user.id).first.increment!(:points_alltime, by = @roundpointstoadd)
    end

    # add bonus points to winner
    if Famroomanswer.first.round == 1 ||
      Famroomanswer.first.round == 6
      @bonuspoints = 3
    elsif Famroomanswer.first.round == 2 ||
      Famroomanswer.first.round == 7
      @bonuspoints = 4
    elsif Famroomanswer.first.round == 3 ||
      Famroomanswer.first.round == 8
      @bonuspoints = 5
    elsif Famroomanswer.first.round == 4 ||
      Famroomanswer.first.round == 9
      @bonuspoints = 6
    elsif Famroomanswer.first.round == 5 ||
      Famroomanswer.first.round == 10
      @bonuspoints = 7
    else
      @bonuspoints = 0
    end
    @roundwinnerforbonus = Famroomanswer.order('points DESC, created_at ASC').first.user
    if @roundwinnerforbonus.id == current_user.id &&
      User.where('id = ?', current_user.id).first.answervotedfor != nil
      @roundwinnerforbonus.increment!(:gamepoints, by = @bonuspoints)
      @roundwinnerforbonus.increment!(:points_alltime, by = @bonuspoints)
    end

    # keep winning acro and some of its info
    @roundanswertosave = Famroomanswer.order('points DESC, created_at ASC')
                     .first
    if @roundanswertosave.user.id == current_user.id
      @rats_answer = @roundanswertosave.answer
      @rats_user = @roundanswertosave.user_id
      @rats_points = @roundanswertosave.points
      @rats_acroletters = @roundanswertosave.acroletters
      @rats_category = @roundanswertosave.category
      @rats_answertime = @roundanswertosave.answertime
      Winninganswer.create(:answer => @rats_answer, :user_id => @rats_user,
        :points => @rats_points, :acroletters => @rats_acroletters,
        :category => @rats_category, :answertime => @rats_answertime,
        :roomname => "Family Room")
    end
    # and only allow the last 25 winning answers
    Winninganswer.destroy_all(['id NOT IN (?)', Winninganswer.last(25)
      .collect(&:id)])

    render :nothing => true
  end

  def destroyplayer
    @famroomplayerlist = Player.where(:room => "familyroom")
    Player.delete_all(["name = ? AND room = ?", current_user
          .username, 'familyroom'])

    User.where('id = ?', current_user.id).first
        .update_attributes(:answervotedfor => nil, :gamepoints => 0)

    if @famroomplayerlist.count < 3
      Famroomroundtime.destroy_all
      eventArray = []
      Famroomanswer.destroy_all
      Famroomacroletters.destroy_all
      Famroomcat.destroy_all
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Game ended.' }
      format.json { head :no_content }
    end
  end

  def votefor
    @famroomanswers = Famroomanswer.all
    Famroomanswer.find(:all, :conditions => ["id = ?", params[:id]]).each do |ans|
      ans.increment!(:points)
      ans.update_attributes(:gotvote => true)
    end
    User.find(:first, :conditions => ["id = ?", current_user.id])
      .update_attributes(:answervotedfor => params[:id])

    render :nothing => true
  end

  def resetfamroom
    Famroomacroletters.destroy_all
    Famroomroundtime.destroy_all
    eventArray = []
    Famroomcat.destroy_all
    Message.destroy_all
    render :nothing => true
  end

  def evacfamroom
    Player.where(:room => "familyroom").destroy_all
    render :nothing => true
  end

  def endofgamestatsinit
    @gamewinner = User.joins(:player).where('room = ?', 'familyroom')
                      .order('users.gamepoints DESC').first
    @playerlist = Player.where(:room => "familyroom")
    if current_user.id == @gamewinner.id
      current_user.increment!(:gameswon, by = 1)
    end
    current_user.increment!(:gamesplayed, by = 1)
    render :nothing => true
  end

  def newgamegetready
    Famroomacroletters.destroy_all
    Famroomroundtime.destroy_all
    Famroomcat.destroy_all
    eventArray = []
    render :nothing => true
    User.where('id = ?', current_user.id).first.update_attributes(:answervotedfor => nil,
      :gamepoints => 0)
  end

  def playercountcheck
    @playerlist = Player.where(:room => "familyroom")
    if @playerlist.count < 3
      Famroomroundtime.destroy_all
      eventArray = []
      Famroomanswer.destroy_all
      Famroomacroletters.destroy_all
      Famroomcat.destroy_all
    end
    render :nothing => true
  end

  def updatewinnertweet
    @tweetacroletters = Winninganswer.where('user_id = ?', current_user.id)
                                     .last.acroletters
    @tweetcat = Winninganswer.where('user_id = ?', current_user.id)
                             .last.category
    @tweetanswer = Winninganswer.where('user_id = ?', current_user.id)
                                .last.answer
    render :nothing => true
  end

  def sauna
  end

end
