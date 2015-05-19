# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cotacao/version'

Gem::Specification.new do |spec|
  spec.name          = "cotacao"
  spec.version       = Cotacao::VERSION
  spec.authors       = ["Thadeu Brito"]
  spec.email         = ["itvbrito@gmail.com"]
  spec.summary       = %q{Show currency conversion.}
  spec.description   = %q{Show currency conversion.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

end