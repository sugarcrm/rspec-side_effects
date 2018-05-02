require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'pathname'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = '--warnings'
end

RuboCop::RakeTask.new(:rubocop) do |task|
  rubocop_report_pathname =
    Pathname(Rake.application.original_dir).join('tmp', 'rubocop.txt')
  rubocop_report_pathname.dirname.mkpath
  task.requires << 'rubocop-rspec'
  task.options =
    %w[
      --display-cop-names
      --extra-details
      --display-style-guide
      --fail-level error
      --format progress
      --format simple --out
    ].push(rubocop_report_pathname.to_s)
end

task default: %i[spec rubocop]
