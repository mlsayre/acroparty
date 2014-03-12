class Winninganswer < ActiveRecord::Base
  attr_accessible :user_id, :answer, :answertime,
                  :points, :category, :acroletters, :roomname

  belongs_to :user

end
