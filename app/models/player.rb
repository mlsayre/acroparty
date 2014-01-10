class Player < ActiveRecord::Base
  attr_accessible :name, :room, :user_id

  belongs_to :user
end
