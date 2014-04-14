class ApplicationController < ActionController::Base
  protect_from_forgery
  #around_filter :set_time_zone

  def after_sign_in_path_for(resource)
    foyer_path
  end

  def round_timings
    # ROUND TIMINGS
    @newgamestartstime = 5  #10
    @r1preptime = 5         #15
    @r1writetime = 70        #70
    @r1votetime = 30         #30
    @r1restime = 21  #When changing restime ALSO CHANGE @synctime
    @r2preptime = 5        #15              (votetime - 10)
    @r2writetime = 71.5
    @r2votetime = 30
    @r2restime = 21
    @r3preptime = 5
    @r3writetime = 73
    @r3votetime = 30
    @r3restime = 21
    @r4preptime = 5
    @r4writetime = 74.5
    @r4votetime = 30
    @r4restime = 21
    @r5preptime = 5
    @r5writetime = 76
    @r5votetime = 30
    @r5restime = 21
    @r6preptime = 5
    @r6writetime = 70
    @r6votetime = 30
    @r6restime = 21
    @r7preptime = 5
    @r7writetime = 71.5
    @r7votetime = 30
    @r7restime = 21
    @r8preptime = 5
    @r8writetime = 73
    @r8votetime = 30
    @r8restime = 21
    @r9preptime = 5
    @r9writetime = 74.5
    @r9votetime = 30
    @r9restime = 21
    @r10preptime = 5
    @r10writetime = 76
    @r10votetime = 30
    @r10restime = 21
    @finalresultstime = 25
  end

  # def set_time_zone
  #   old_time_zone = Time.zone
  #   Time.zone = current_user.time_zone if user_signed_in?
  #   yield
  # ensure
  #   Time.zone = old_time_zone
  # end
end
