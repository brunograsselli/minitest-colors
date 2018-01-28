# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minitest-colors/version'

Gem::Specification.new do |spec|
  spec.name          = "minitest-colors"
  spec.version       = MinitestColors::VERSION
  spec.authors       = ["Bruno Grasselli"]
  spec.email         = ["bruno.grasselli@gmail.com"]

  spec.summary       = "Minitest plugin that prints colorful progress report"
  spec.description   = "Minitest plugin that prints colorful progress report. Less colorful than minetest/pride."
  spec.homepage      = "https://github.com/brunograsselli/minitest-colors"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "minitest", ">= 5.7.0"
end
