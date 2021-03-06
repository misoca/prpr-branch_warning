# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prpr/branch_warning/version'

Gem::Specification.new do |spec|
  spec.name          = "prpr-branch_warning"
  spec.version       = Prpr::BranchWarning::VERSION
  spec.authors       = ["mallowlabs"]
  spec.email         = ["mallowlabs@gmail.com"]

  spec.summary       = "Prpr plugin: add a label to pull requests that merge to the not default branch"
  spec.description   = "This plugin add a label to pull requests that merge to the not default branch"
  spec.homepage      = "https://github.com/misoca/prpr-branch_warning"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 12.3.3"
end
