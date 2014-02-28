class Famroomanswer < ActiveRecord::Base
  attr_accessible :user_id, :round, :answer, :roundstarted, :answertime,
                  :points, :winner
end
