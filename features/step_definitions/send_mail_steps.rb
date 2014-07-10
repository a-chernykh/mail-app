When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I fill in "(.*?)" with$/) do |field, value|
end
