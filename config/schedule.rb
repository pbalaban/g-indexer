set :output, "#{path}/log/cron.log"

every 4.hours do
  rake 'cron:every_4_hours'
end

every :midnight do
  rake 'cron:midnight'
end

every :weekly do
  rake 'cron:weekly'
end
