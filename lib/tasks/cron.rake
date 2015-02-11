namespace :cron do
  desc 'Task which executed every 4 hours'
  task every_4_hours: :environment do
    max_seconds   = (4.hours - 30.minutes).to_i
    start_seconds = 30.minutes.to_i
    seconds_step  = max_seconds/Domain.count

    Domain.all.each.with_index do |domain, index|
      range = Range.new(start_seconds + index*seconds_step, start_seconds + (index+1)*seconds_step)
      CheckHostJob.set(wait: rand(range).seconds).perform_later(domain)
    end
  end
end
