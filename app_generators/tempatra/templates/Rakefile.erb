require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'spec/rake/spectask'

task :default => [ :spec, :cucumber ]

desc "Run the code examples in spec/"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', "\"spec/spec.opts\""]
  t.spec_files = FileList["spec/*_spec.rb"]
end

namespace :spec do

  desc "Run all specs in spec directory with RCov"
  Spec::Rake::SpecTask.new(:rcov) do |t|
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/*_spec.rb']
    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines(File.dirname(__FILE__) + "/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end

  desc "Print Specdoc for all specs"
  Spec::Rake::SpecTask.new(:doc) do |t|
    t.spec_opts = ["--format", "specdoc", "--dry-run"]
    t.spec_files = FileList['spec/*_spec.rb']
  end

end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:cucumber, 'Run all Cucumber features') do |t|
  t.fork = true # You may get faster startup if you set this to false
  t.cucumber_opts = "--guess --tags ~@wip --strict --format #{ENV['CUCUMBER_FORMAT'] || 'pretty'}"
end
