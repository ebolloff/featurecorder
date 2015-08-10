Feature: Featurecorder

@announce
Scenario: Parse valid XML file
When I run `featurecorder ../../features/fixtures/login_cat.xml -s "search for cat" -f "global search"`
Then the exit status should be 0
And a file named "GlobalSearch.feature" should exist
And a file named "global_search_steps.rb" should exist
And the file "GlobalSearch.feature" should contain "Feature: global search"
And the file "GlobalSearch.feature" should contain "Scenario: search for cat"