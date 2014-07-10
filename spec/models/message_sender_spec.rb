require 'rails_helper'

describe MessageSender do
  let(:body ) do <<-EOT
Hi, friend,

How you're doing today?

Cheers,
Me.
EOT
  end
  let(:message) do 
    build :message, to_email: 'recipient@mail.com',
                    subject: 'Hi there',
                    body: body,
                    attachment: File.open('spec/fixtures/attachment.jpg')
  end

  describe '#send_email' do
    subject(:mail) { described_class.new(message).send_email.last }
    
    it 'from noreply@example.com' do
      expect(mail).to be_delivered_from('noreply@example.com')
    end

    it 'to recipient@mail.com' do
      expect(mail).to be_delivered_to('recipient@mail.com')
    end

    it 'is with subject Hi there' do
      expect(mail).to have_subject('Hi there')
    end

    it 'has body' do
      expect(mail).to have_body_text(body)
    end

    it 'has attachment' do
      expect(mail.attachments.select { |a| a.filename == 'attachment.jpg' }).to be_present
    end

    it 'does not includes attachment for messages without attachments' do
      without_attachment = described_class.new(build(:message)).send_email.last
      expect(without_attachment.attachments).to be_empty
    end
  end
end
