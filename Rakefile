require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "tempatra"
    gem.summary = %Q{A RubiGen based Sinatra application generator.}
    gem.description = %Q{A Sinatra application generator using Blueprint CSS, jQuery, Haml, Sass, Compass, RSpec, Cucumber, and Webrat.}
    gem.email = "olauzon@gmail.com"
    gem.homepage = "http://github.com/olauzon/tempatra"
    gem.authors = ["Olivier Lauzon"]

    gem.add_dependency('compass', '>= 0.8.17')
    gem.add_dependency('cucumber', '>= 0.4.4')
    gem.add_dependency('haml', '>= 2.2.13')
    gem.add_dependency('rack-test', '>= 0.5.2')
    gem.add_dependency('rake', '>= 0.8.7')
    gem.add_dependency('rdiscount', '>= 1.5.5')
    gem.add_dependency('rspec')
    gem.add_dependency('rubigen', '>= 1.5.2')
    gem.add_dependency('sinatra', '>= 0.9.4')
    gem.add_dependency('thin', '>= 1.2.3')
    gem.add_dependency('webrat', '>= 0.5.3')
    gem.add_dependency('shotgun', '>= 0.4')

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.files = FileList[ 'app_generators/**/*',
                          'bin/*',
                          'lib/**/*.rb',
                          '[A-Z]*',
                          'spec/**/*'].to_a.reject { |f| f =~ /^spec\/tmp/ }
    gem.test_files = FileList['spec/**/*'].to_a.reject { |f| f =~ /^spec\/tmp/ }
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
  spec.rcov_opts = lambda do
    IO.readlines(File.dirname(__FILE__) + "/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
  end
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "tempatra #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
