class Message < ActiveRecord::Base
  attr_accessible :content, :user_id

  belongs_to :user

  validates :content,  obscenity: { sanitize: true, replacement: :stars }

  def pacifictime
    created_at.utc - 7.hours
  end
end

