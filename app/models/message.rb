require 'file_size_validator'

class Message < ActiveRecord::Base
  def self.is_draft_checker
    -> (message) { message.is_draft }
  end

  mount_uploader :attachment, AttachmentUploader

  validates :to_email, presence: true, email: true, unless: Message.is_draft_checker
  validates :subject, presence: true, unless: Message.is_draft_checker
  validates :attachment, file_size: { maximum: 20.megabytes.to_i }

  after_create :send_message, unless: Message.is_draft_checker

  private

  def send_message
    MessageSender.new(self).send_email
  end
end
