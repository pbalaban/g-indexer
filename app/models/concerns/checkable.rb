module Checkable
  extend ActiveSupport::Concern

  module ClassMethods
    def schedule_jobs
      max_seconds   = (4.hours - 30.minutes).to_i
      start_seconds = 30.minutes.to_i
      seconds_step  = max_seconds/self.count

      self.all.each.with_index do |obj, index|
        range = Range.new(
          start_seconds + index*seconds_step,
          start_seconds + (index+1)*seconds_step
        )

        check_job_class.set(wait: rand(range).seconds).perform_later(obj)
      end
    end
  end

  def formatted_checked_at
    return nil unless self.checked_at

    self.checked_at.in_time_zone('Pacific Time (US & Canada)').strftime('%b %d, %I:%M %p %Z')
  end
end
