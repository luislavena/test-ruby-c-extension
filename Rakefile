require "rubygems/package_task"
require 'rake/extensiontask'

# prepend DevKit into compilation phase
if RUBY_PLATFORM =~ /mingw/
  task :compile => [:devkit]
end

spec = Gem::Specification.load("testext.gemspec")

Rake::ExtensionTask.new('testext', spec) do |ext|
  ext.cross_compile = true if RUBY_PLATFORM !~ /mswin|mingw/
  ext.cross_platform = ['x86-mingw32', 'x64-mingw32']
end

Gem::PackageTask.new(spec) do |pkg|
end

task :devkit do
  begin
    require "devkit"
  rescue LoadError => e
    abort "Failed to activate RubyInstaller's DevKit required for compilation."
  end
end

task :test => [:compile] do
  ruby %q(-Ilib -rtestext -e "puts 'done'")
end

task :default => [:test, "native", :gem]
