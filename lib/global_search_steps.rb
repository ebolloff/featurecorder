When(/^I visit root_path$/) do
	visit root_path
end

Then(/^I should see the text 'New to Ontohub\? Sign up!'$/) do
	page.should have_content('New to Ontohub? Sign up!')
end

When(/^I fill in 'signin_password' with 'changeme'$/) do
	fill_in('signin_password', :with => 'changeme')
end

When(/^I fill in 'signin_email' with 'admin@example.com'$/) do
	fill_in('signin_email', :with => 'admin@example.com')
end

When(/^I click on 'Sign In'$/) do
	click_on('Sign In')
end

Then(/^I should see the text 'admin'$/) do
	page.should have_content('admin')
end

When(/^I click on 'Ontologies'$/) do
	click_on('Ontologies')
end

When(/^I fill in 'query' with 'cat'$/) do
	fill_in('query', :with => 'cat')
end

Then(/^I should see the text 'Cat .clif'$/) do
	page.should have_content('Cat .clif')
end

When(/^I click on 'Cat'$/) do
	click_on('Cat')
end

Then(/^I should see the text 'CommonLogic'$/) do
	page.should have_content('CommonLogic')
end
