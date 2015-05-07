# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_freaky/version'
require 'get_freaky/info'

Gem::Specification.new do |s|
  s.name    = 'get_freaky'
  s.version = GetFreaky::VERSION
  s.executables << 'get_freaky'
  s.date = GetFreaky::DATE
  s.date = '2015-05-05'
  s.summary = %q{Get Freaky!}
  s.description = Info::DESCRIPTION
  s.authors = ["Stephen Mariano Cabrera"]
  s.email = 'stephen.m.cabrera@gmail.com'
  s.files = %w{
     lib/get_freaky.rb
     lib/get_freaky/conference.rb
     lib/get_freaky/event.rb
     lib/get_freaky/video.rb
     lib/get_freaky/version.rb
     lib/get_freaky/info.rb
  }
  s.bindir      = "bin"
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage    = 'https://github.com/smcabrera/get_freaky'
  s.license     = 'MIT'

  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  s.add_runtime_dependency "httparty", '~> 0.13'
  s.add_runtime_dependency "slugify", '~> 1.0'
  s.add_runtime_dependency "viddl-rb", '~> 1.1'

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake", "~> 10.0"
end

