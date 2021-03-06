# -*- encoding: utf-8 -*-
require File.expand_path('../lib/medic/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "medic"
  spec.version       = Medic::VERSION
  spec.authors       = ["Ryan Linton"]
  spec.email         = ["ryanl@clearsightstudio.com"]
  spec.description   = %q{RubyMotion Wrapper for HealthKit}
  spec.summary       = %q{A RubyMotion Wrapper for HealthKit}
  spec.homepage      = "https://github.com/ryanlntn/medic"
  spec.license       = "MIT"

  spec.files         = Dir.glob("lib/**/*.rb")
  spec.files         << "README.md"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = Dir.glob("spec/**/*.rb")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10"
  spec.add_development_dependency "motion-stump", "~> 0.3"
end
