# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'randsum/version'
require 'randsum/metadata'

Gem::Specification.new do |spec|
  spec.name          = 'randsum'
  spec.version       = Randsum::VERSION
  spec.authors       = ['Alex Jarvis']
  spec.email         = ['alxjrvs@gmail.com']
  spec.summary       = Randsum::SUMMARY
  spec.description   = Randsum::DESCRIPTION
  spec.homepage      = Randsum::HOMEPAGE
  spec.license       = Randsum::LICENSE
  spec.required_ruby_version = '>= 3.1.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'debug', '~> 1.8.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.56.0'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.24.0'
end
