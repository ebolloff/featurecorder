Feature: Featurecorder

Scenario: Parse valid XML Selenium file with parameters
When I run `featurecorder ../../features/fixtures/login_cat.xml -f "global search" -s "search for cat"`
Then the exit status should be 0
And a file named "GlobalSearch.feature" should exist
And a file named "global_search_steps.rb" should exist
And the file "GlobalSearch.feature" should contain "Feature: global search"
And the file "GlobalSearch.feature" should contain "Scenario: search for cat"

Scenario: Parse valid XML Selenium file interactively
When I run `featurecorder ../../features/fixtures/login_cat.xml` interactively
And I type "global search"
And I type "search for cat"
Then the exit status should be 0
And a file named "GlobalSearch.feature" should exist
And a file named "global_search_steps.rb" should exist
And the file "GlobalSearch.feature" should contain "Feature: global search"
And the file "GlobalSearch.feature" should contain "Scenario: search for cat"

Scenario: Parse invalid XML file
When I run `featurecorder ../../features/fixtures/invalid_empty_file`
Then the exit status should be 1
And the stderr should contain "Not a valid XML document"
And a file matching %r<.*\.rb> should not exist
And a file matching %r<.*\.feature> should not exist

Scenario: Parse invalid Selenium Test
When I run `featurecorder ../../features/fixtures/invalid_file.xml`
Then the exit status should be 1
And the stderr should contain "Not a valid Selenium XML Test"
And a file matching %r<.*\.rb> should not exist
And a file matching %r<.*\.feature> should not exist

Scenario: Parse empty XML Selenium file
When I run `featurecorder ../../features/fixtures/empty.xml`
Then the exit status should be 1
And the stderr should contain "Empty Selenium XML Test"
And a file matching %r<.*\.rb> should not exist
And a file matching %r<.*\.feature> should not exist

Scenario: Parse to forbidden directory
When I run `featurecorder ../../features/fixtures/login_cat.xml -f "global search" -s "search for cat" -o /`
Then the exit status should be 1
And the stderr should contain "Permission denied on /"

Scenario: Parse to non-existent directory
When I run `featurecorder ../../features/fixtures/login_cat.xml -f "global search" -s "search for cat" -o /foobar`
Then the exit status should be 1
And the stderr should contain "Could not find /foobar"

