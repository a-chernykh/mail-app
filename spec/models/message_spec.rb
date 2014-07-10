require 'rails_helper'

describe Message do
  describe 'validations' do
    context 'not draft' do
      it { should validate_presence_of(:to_email) }
      it { should allow_value('my@email.com').for(:to_email) }
      it { should_not allow_value('my.incorrect.email.com').for(:to_email) }
      it { should validate_presence_of(:subject) }
    end

    context 'is draft' do
      subject { described_class.new is_draft: true }

      it { should_not validate_presence_of(:to_email) }
      it { should allow_value('my.incorrect.email.com').for(:to_email) }
      it { should_not validate_presence_of(:subject) }
    end
  end

  it 'sends non-draft message' do
    message = build :message

    message_sender = double 'MessageSender', send: true
    allow(MessageSender).to receive(:new).with(message).and_return message_sender
    expect(message_sender).to receive(:send_email)
    message.save!
  end

  it 'does not sends draft message' do
    expect_any_instance_of(MessageSender).not_to receive(:send_email)
    create :message, is_draft: true
  end
end
