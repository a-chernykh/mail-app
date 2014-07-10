class Message < ActiveRecord::Base
  validates :to_email, presence: true, email: true, unless: -> (message) { message.is_draft }
  validates :subject, presence: true, unless: -> (message) { message.is_draft }
end
