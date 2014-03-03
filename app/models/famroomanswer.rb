class Famroomanswer < ActiveRecord::Base
  attr_accessible :user_id, :round, :answer, :roundstarted, :answertime,
                  :points, :winner

  belongs_to :user

  attr_reader :answertime

  def answertime
    (updated_at - roundstarted).round(2)
  end

end
