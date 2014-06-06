# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inaho/version'

Gem::Specification.new do |spec|
  spec.name          = "inaho"
  spec.version       = Inaho::VERSION
  spec.authors       = ["Sebastian Szturo"]
  spec.email         = ["s.szturo@me.com"]
  spec.description   = "Easily create Dictionaries for Apple's Dictionary.app."
  spec.summary       = "Easily create Dictionaries for Apple's Dictionary.app."
  spec.homepage      = "http://github.com/SebastianSzturo/Inaho"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
end
