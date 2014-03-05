class Famroomanswer < ActiveRecord::Base
  attr_accessible :user_id, :round, :answer, :roundstarted, :answertime,
                  :points, :winner, :category, :acroletters

  belongs_to :user

  # validates :answer, acronym: true

  attr_reader :answertime

  def answertime
    (updated_at - roundstarted).round(2)
  end

end
