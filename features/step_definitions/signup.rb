When(/^I create a user with email "(.*?)" and password "(.*?)"$/) do |email, password|
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_on 'submit'
end

Then(/^I shall see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
