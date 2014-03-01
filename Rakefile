require "rubygems/package_task"
require 'rake/extensiontask'

spec = Gem::Specification.load("testext.gemspec")

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
