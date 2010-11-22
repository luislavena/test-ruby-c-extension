require 'rake/extensiontask'

Rake::ExtensionTask.new('testext') do |ext|
  ext.cross_compile = true if RUBY_PLATFORM !~ /mswin|mingw/
end

task :test => [:compile] do
  ruby %q(-Ilib -rtestext -e "puts 'done'")
end