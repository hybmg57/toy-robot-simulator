begin
	require 'rake'
	require 'rspec/core/rake_task'
	require 'reek/rake/task'
rescue LoadError => err
	warn err.message
end

desc "To run all tasks: RSpec, Reek, Yard and Markdown"
task :default => [:spec, :reek]

RSpec::Core::RakeTask.new

Reek::Rake::Task.new

system('yard')
system('markdown')