# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'matrext/version'

source_uri = 'https://github.com/michaelchadwick/matrext'
rubygem_uri = 'http://rubygems.org/gems/matrext'

Gem::Specification.new do |spec|
  spec.name           = 'matrext'
  spec.summary        = 'Display decoded text, Matrix-style'
  spec.version        = Matrext::VERSION
  spec.platform       = Gem::Platform::RUBY
  spec.authors        = ['Michael Chadwick']
  spec.email          = ['mike@codana.me']
  spec.homepage       = rubygem_uri
  spec.license        = 'MIT'
  spec.description    = 'Matrext takes a string input and then prints it back to the console, one letter at a time after "searching" through character noise, as if it was decoding the string itself.'

  spec.files          = `git ls-files`.split("\n")
  spec.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths  = ['lib']

  spec.metadata       = {
    "documentation_uri" => source_uri,
    "homepage_uri" => source_uri,
    "source_code_uri" => source_uri
  }

  ## required deps
  spec.add_runtime_dependency 'colorize', '~> 1.0'

  ## development deps
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'pry-byebug', '~> 3.9'
end
