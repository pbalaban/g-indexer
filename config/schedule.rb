set :output, "#{path}/log/cron.log"

every 4.hours do
  rake 'cron:every_4_hours'
end
