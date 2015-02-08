namespace :cron do
  desc 'Start task at 7:00PM, 3:00AM, 11:00AM in EST'
  task every_8_hours: :environment do
    #next 8.hours - 60.minutes
    max_seconds   = 28800 - 3600
    start_seconds = 1800
    seconds_step  = max_seconds/Domain.count

    Domain.all.each.with_index do |domain, index|
      range = Range.new(start_seconds + index*seconds_step, start_seconds + (index+1)*seconds_step)
      CheckHostJob.set(wait: rand(range).seconds).perform_later(domain)
    end
  end
end
