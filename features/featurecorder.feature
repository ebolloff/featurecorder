Feature: Featurecorder

Scenario: Parse valid XML file with parameters
When I run `featurecorder ../../features/fixtures/login_cat.xml -f "global search" -s "search for cat"`
Then the exit status should be 0
And a file named "GlobalSearch.feature" should exist
And a file named "global_search_steps.rb" should exist
And the file "GlobalSearch.feature" should contain "Feature: global search"
And the file "GlobalSearch.feature" should contain "Scenario: search for cat"

Scenario: Parse valid XML file interactively
When I run `featurecorder ../../features/fixtures/login_cat.xml` interactively
And I type "global search"
And I type "search for cat"
Then the exit status should be 0
And a file named "GlobalSearch.feature" should exist
And a file named "global_search_steps.rb" should exist
And the file "GlobalSearch.feature" should contain "Feature: global search"
And the file "GlobalSearch.feature" should contain "Scenario: search for cat"

Scenario: Parse invalid XML file
When I run `featurecorder ../../features/fixtures/invalid_file`
Then the exit status should be 1
And the stderr should contain "Not a valid XML document"
And a file matching %r<.*\.rb> should not exist
And a file matching %r<.*\.feature> should not exist
