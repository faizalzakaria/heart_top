# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heart_top/version'

Gem::Specification.new do |spec|
  spec.name          = 'heart_top'
  spec.version       = HeartTop::VERSION
  spec.authors       = ['Faizal Zakaria']
  spec.email         = ['fzakaria@codegarage.co']

  spec.summary       = 'HeartTop pings the heartbeat of your laptop every N seconds'
  spec.description   = "Have you ever go to free space, coffee shops or some random place to work, \
and you need to to toilet for pee, or big business? Then worried what would happen to your laptop? \
This tool could be the solution"
  spec.homepage      = 'https://github.com/faizalzakaria/heart_top'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
  spec.add_dependency 'terminal-table', '~> 1.8'
  spec.add_dependency 'rainbow', '~> 2.2'
  spec.add_dependency 'dante', '~> 0.2'
end
