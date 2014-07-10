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
end
