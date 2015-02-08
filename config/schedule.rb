set :output, "#{path}/log/cron.log"

every 8.hours do
  rake 'cron:every_8_hours'
end
