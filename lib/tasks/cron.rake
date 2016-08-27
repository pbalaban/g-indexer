namespace :cron do
  desc 'Task which executed every 4 hours'
  task every_4_hours: :environment do
    # Domain.schedule_jobs
    Backlink.schedule_jobs
  end
end
