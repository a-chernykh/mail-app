When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I fill in "(.*?)" with$/) do |field, value|
  fill_in field, with: value
end

When(/^I click "(.*?)"$/) do |button_name|
  click_on button_name
end

Then(/^new draft for "(.*?)" shiuld be saved$/) do |email|
  expect(Message.where(to_email: email, is_draft: true).first).to be_present
end
