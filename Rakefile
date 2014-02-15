require "rubygems/package_task"
require 'rake/extensiontask'

spec = Gem::Specification.new do |s|
  s.name = "testext"
  s.platform = Gem::Platform::RUBY
  s.version = "0.0.1"
  s.summary = "Test of Ruby C extensions"
  s.description = "A simple Ruby C extension that test rake-compiler building blocks"
  s.author = "Luis Lavena"
  s.email = "luislavena@gmail.com"
  s.license = "MIT"
  s.homepage = "http://github.com/luislavena/test-ruby-c-extension"

  s.files = FileList["ext/**/*.{c,rb}", "Rakefile"]
  s.extensions = FileList["ext/**/extconf.rb"]
end

Rake::ExtensionTask.new('testext', spec) do |ext|
  ext.cross_compile = true if RUBY_PLATFORM !~ /mswin|mingw/
  ext.cross_platform = ['x86-mingw32', 'x64-mingw32']
end

Gem::PackageTask.new(spec) do |pkg|
end

task :test => [:compile] do
  ruby %q(-Ilib -rtestext -e "puts 'done'")
end

task :default => [:test, "native", :gem]
