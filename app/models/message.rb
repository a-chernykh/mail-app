class Message < ActiveRecord::Base
  def self.is_draft_proc
    -> (message) { message.is_draft }
  end

  validates :to_email, presence: true, email: true, unless: Message.is_draft_proc
  validates :subject, presence: true, unless: Message.is_draft_proc

  after_create :send_message, unless: Message.is_draft_proc

  private

  def send_message
    MessageSender.new(self).send_email
  end
end
