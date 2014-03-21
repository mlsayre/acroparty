class Update < ActiveRecord::Base
  attr_accessible :news, :user_id

  belongs_to :user
end
