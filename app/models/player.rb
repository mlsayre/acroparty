class Player < ActiveRecord::Base
  attr_accessible :name, :room, :user_id, :gamepoints

  validates_uniqueness_of :name, :scope => :room

  belongs_to :user
end
