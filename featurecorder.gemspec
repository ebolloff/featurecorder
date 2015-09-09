# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'featurecorder/version'

Gem::Specification.new do |spec|
  spec.name          = "featurecorder"
  spec.version       = Featurecorder::VERSION
  spec.authors       = ["Eileen Bolloff"]
  spec.email         = ["ebolloff@tzi.de"]

  spec.summary       = "This gem translates recorded Selenium XML tests to Cucumber."
  spec.homepage      = "https://github.com/ebolloff/featurecorder"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry', '~> 0.10', '>= 0.10.1'
  spec.add_development_dependency 'cucumber', '~> 2.0.0'
  spec.add_development_dependency 'aruba', '~> 0.8.1'

  spec.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.6.2'
  spec.add_runtime_dependency 'ascii', '~> 1.0', '>= 1.0.1'
  spec.add_runtime_dependency 'docopt', '>= 0.5'
end
