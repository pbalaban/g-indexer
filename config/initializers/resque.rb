require 'resque-scheduler'
require 'resque/scheduler/server'

Resque.redis = Redis.new(host: :localhost, port: 6379, db: 100)
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
