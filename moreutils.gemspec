# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moreutils/version'

Gem::Specification.new do |spec|
  spec.name          = 'moreutils'
  spec.version       = Moreutils::VERSION
  spec.authors       = ['Corin Schedler']
  spec.email         = ['corin@dubdromic.com']

  spec.summary       = %q{Ruby versions of moreutils}
  spec.description   = %q{Ruby versions of moreutils}
  spec.homepage      = 'https://github.com/dubdromic/moreutils'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry'
end
