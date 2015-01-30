require 'resque/scheduler/tasks'
require 'resque/tasks'

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'
  end
end

task 'resque:setup' => :environment
