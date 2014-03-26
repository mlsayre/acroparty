class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :username, :location, :about, :avatar, :gameswon, :login,
                  :gamesplayed, :ignores, :boots, :highestscore, :dateofbirth,
                  :avatar_original_w, :avatar_original_h, :avatar_box_w,
                  :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h,
                  :avatar_aspect, :time_zone, :answervotedfor, :gamepoints

  attr_accessor :login

  has_many :messages
  has_one :player

  # attr_accessible :title, :body
  validates_presence_of :username

  validates_length_of :username, :maximum => 15
  validates_length_of :username, :minimum => 3
  validates_length_of :about, :maximum => 80

  validates :email, :uniqueness => {:case_sensitive => false}
  validates :username, :uniqueness => {:case_sensitive => false}

  has_attached_file :avatar, styles: {
    small: '80x80>',
    large: '300x300>'
    },
    :default_url => 'https://s3-us-west-2.amazonaws.com/apavatars/ap_generic_avatar80.png'

  crop_attached_file :avatar

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      if auth.provider == "twitter"
        user.email = auth.info.nickname + "@twitter.com"
        user.avatar = auth["info"]["image"].sub("_normal", "")
      else
        user.email = auth["info"]["email"]
        user.avatar = "http://graph.facebook.com/#{self.uid}/picture?type=large"
      end

    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end
