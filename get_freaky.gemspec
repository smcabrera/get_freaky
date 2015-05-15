# coding: utf-8
require 'get_freaky/version'
require 'get_freaky/info'

Gem::Specification.new do |s|
  s.name    = 'get_freaky'
  s.version = GetFreaky::VERSION
  s.date = GetFreaky::DATE
  s.summary = %q{Get Freaky!}
  s.description = Info::DESCRIPTION
  s.authors = ["Stephen Mariano Cabrera"]
  s.email = 'stephen.m.cabrera@gmail.com'
  s.files = Dir["{bin,lib}/**/*", "LICENSE", "README.md", "lib/get_freaky/version.rb"]
  s.executables = ['get_freaky']
  s.test_files = Dir["spec/**/*"]
  s.require_paths = ["lib"]
  s.homepage    = 'https://github.com/smcabrera/get_freaky'
  s.license     = 'MIT'

  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  s.add_runtime_dependency 'commander', '4.3.4'
  s.add_runtime_dependency "httparty", "~> 0.13"
  s.add_runtime_dependency "slugify", "~> 1.0"
  s.add_runtime_dependency "viddl-rb", "~> 1.1"

  s.add_development_dependency 'fabricas', '1.1.3'
  s.add_development_dependency "aruba", "0.6.2"
  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'jazz_fingers', '1.0.0'
end

