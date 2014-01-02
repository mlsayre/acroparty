class PagesController < ApplicationController
  def foyer
    @username = current_user.username
  end
end
