class Famroomanswer < ActiveRecord::Base
  attr_accessible :user_id, :round, :answer, :roundstarted, :answertime,
                  :points, :winner, :category, :acroletters, :playervoted,
                  :gotvote

  belongs_to :user

  # validates :answer, acronym: true

  attr_reader :answertime

  def answertime
    if created_at && roundstarted
      rawtime = (created_at - roundstarted)
      rawtime.round(2)
    else
      30.00
    end
  end

end
