# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-fwdports/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-fwdports"
  spec.version       = Vagrant::Fwdports::VERSION
  spec.authors       = ["Takuya Arita"]
  spec.email         = ["takuya.arita@gmail.com"]
  spec.description   = "Show list of forwarded ports on Vagrant VM."
  spec.summary       = "Show list of forwarded ports on Vagrant VM."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "terminal-table"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
