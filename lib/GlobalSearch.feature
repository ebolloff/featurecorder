Feature: global search

Scenario: search for cat

When I visit root_path
Then I should see the text 'New to Ontohub? Sign up!'
When I fill in 'signin_password' with 'changeme'
When I fill in 'signin_email' with 'admin@example.com'
When I click on 'Sign In'
Then I should see the text 'admin'
When I click on 'Ontologies'
When I fill in 'query' with 'cat'
Then I should see the text 'Cat .clif'
When I click on 'Cat'
Then I should see the text 'CommonLogic'