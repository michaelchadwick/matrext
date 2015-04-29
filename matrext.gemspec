# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrext/version'

Gem::Specification.new do |spec|
  spec.name            = 'matrext'
  spec.version         = Matrext::VERSION
  spec.platform        = Gem::Platform::RUBY
  spec.authors         = ['Michael Chadwick']
  spec.email           = ['mike@codana.me']
  spec.homepage        = 'http://rubygems.org/gems/matrext'
  spec.summary         = 'Make text phrases look like they\'re being decoded, Matrix-style'
  spec.description     = 'Matrext takes a string input and then prints it back to the console, one letter at a time after "searching" through character noise, as if it was decoding the string itself.'

  spec.files           = `git ls-files`.split("\n")
  spec.test_files      = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables     = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths   = ['lib']
  spec.license         = 'MIT'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
