class FamroomanswersController < ApplicationController

  def familyroom

  end

  def create
    @famroomanswer = Famroomanswer.create!(params[:famroomanswer])
    render :nothing => true
  end
end
