class FamroomanswersController < ApplicationController

  def familyroom

  end

  def create
    Famroomanswer.create(params[:famroomanswer])
    @famroomanswer = Famroomanswer.create!(params[:famroomanswer])
    render :nothing => true
  end
end
