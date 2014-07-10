FactoryGirl.define do
  factory :message do
    to_email 'recipient@email.com'
    subject 'Hey you'
  end
end
