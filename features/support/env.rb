require 'aruba/cucumber'
require 'coveralls'
require 'simplecov'

SimpleCov.command_name 'Cucumber'

Before do
  # This is using the aruba helper,
  # cf. https://github.com/cucumber/aruba/blob/master/lib/aruba/api.rb
  set_environment_variable('COVERAGE', 'true')
  # This could also be accomplished with the "I set the environment variables to:" step
end

Coveralls.wear!