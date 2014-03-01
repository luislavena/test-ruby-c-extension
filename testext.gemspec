# encoding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "testext/version"

Gem::Specification.new do |s|
  s.name = "testext"
  s.platform = Gem::Platform::RUBY
  s.version = TestExt::VERSION
  s.summary = "Test of Ruby C extensions"
  s.description = "A simple Ruby C extension that test rake-compiler building blocks"
  s.author = "Luis Lavena"
  s.email = "luislavena@gmail.com"
  s.license = "MIT"
  s.homepage = "http://github.com/luislavena/test-ruby-c-extension"

  s.files = [
    "ext/testext/extconf.rb",
    "ext/testext/testext.c",
    "lib/testext/version.rb",
    "Rakefile",
    "README.md"
  ]
  s.extensions = Dir.glob("ext/**/extconf.rb")

  s.add_development_dependency "rake-compiler", "~> 0.9"
end
