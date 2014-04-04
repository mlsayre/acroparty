class Message < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user

  validates :content,  obscenity: { sanitize: true, replacement: :stars }
end
