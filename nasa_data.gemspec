# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nasa_data/version'

Gem::Specification.new do |spec|
  spec.name          = "nasa_data"
  spec.version       = NasaData::VERSION
  spec.authors       = ["Matt Gates"]
  spec.summary       = %q{Gem for accessing NASA's Data API}
  spec.homepage      = "http://github.com/mattgates5/nasa_data"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "json", "~> 1.8"
end
