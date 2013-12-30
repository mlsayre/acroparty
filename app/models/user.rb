class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :location, :about, :avatarurl, :gameswon,
                  :gamesplayed, :ignores, :boots, :highestscore, :dateofbirth
  # attr_accessible :title, :body
  validates_presence_of :username

  validates_length_of :username, :maximum => 15
  validates_length_of :username, :minimum => 3
  validates_length_of :about, :maximum => 80

  validates :email, uniqueness: true
  validates :username, uniqueness: true
end
