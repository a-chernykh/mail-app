class MessageSender
  def initialize(message)
    @message = message
  end

  def send_email
    Pony.mail(mail_attrs.merge(from: 'noreply@example.com'))
  end

  private

  def mail_attrs
    attachments = {}
    attachments[@message.attachment.filename] = @message.attachment.file.file if @message.attachment.present?
    { to:          @message.to_email,
      subject:     @message.subject,
      body:        @message.body,
      attachments: attachments }
  end
end
