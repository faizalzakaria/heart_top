# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "heart_top/version"

Gem::Specification.new do |spec|
  spec.name          = "heart_top"
  spec.version       = HeartTop::VERSION
  spec.authors       = ["Faizal Zakaria"]
  spec.email         = ["fzakaria@codegarage.co"]

  spec.summary       = %q{HeartTop pings the heartbeat of your laptop every N seconds}
  spec.description   = "Have you ever go to free space, coffee shops or some random place to work, \
and you need to to toilet for pee, or big business? Then worried what would happen to your laptop? \
This tool could be the solution"
  spec.homepage      = "https://github.com/faizalzakaria/heart_top"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
