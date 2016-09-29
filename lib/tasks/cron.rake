namespace :cron do
  desc 'Task which executed every 4 hours'
  task every_4_hours: :environment do
    # Domain.schedule_jobs
    Backlink.schedule_jobs
  end

  desc 'Task which executed every midnight'
  task midnight: :environment do
    Backlink.expire_tomorrow
  end

  desc 'Task which executed every week'
  task weekly: :environment do
    Backlink.expire_next_week
  end
end
