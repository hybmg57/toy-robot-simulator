begin
	require 'rake'
	require 'rspec/core/rake_task'
	require 'reek/rake/task'
rescue LoadError => err
	warn err.message
end

desc "Run test/codesmell checks with rspec and reek"
task :default => [:spec, :reek]

desc "Perform Rspec tests"
task :spec do 
  RSpec::Core::RakeTask.new
end

desc "Code smell detector with Reek"
task :reek do
  system('reek lib/')
end

desc "Generate documentation"
task :doc do
  system('yard')
  #system('markdown')
end
