# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'defstruct/version'

Gem::Specification.new do |spec|
  spec.name          = "defstruct"
  spec.version       = DefStruct::VERSION
  spec.authors       = ['Tom Dalling']
  spec.email         = ['tom@tomdalling.com']
  spec.summary       = %q{Creates Struct classes with default attribute values.}
  spec.homepage      = 'https://github.com/tomdalling/defstruct'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
