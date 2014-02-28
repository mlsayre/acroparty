class FamroomanswersController < ApplicationController

  def familyroom

  end

  def create
    @famroomanswer = Famroomanswer.create!(params[:famroomanswer])
    # PrivatePub.publish_to("/messages/familyroom", message: @message)
  end
end
