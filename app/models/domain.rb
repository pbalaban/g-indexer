class Domain < ActiveRecord::Base
  MIN_INDEXED_THRESHOLD = 0

  after_save :send_notification

  validates :url, url: { allow_blank: true }, presence: true, uniqueness: true

  def self.schedule_jobs
    max_seconds   = (4.hours - 30.minutes).to_i
    start_seconds = 30.minutes.to_i
    seconds_step  = max_seconds/Domain.count

    Domain.all.each.with_index do |domain, index|
      range = Range.new(
        start_seconds + index*seconds_step,
        start_seconds + (index+1)*seconds_step
      )

      CheckHostJob.set(wait: rand(range).seconds).perform_later(domain)
    end
  end

  def host
    URI.parse(self.url).host
  end

  def set_rank(results)
    self.update(g_index: results[:google].to_i)
    self.touch(:checked_at)
  end

  def g_indexed?
    self.g_index > MIN_INDEXED_THRESHOLD
  end

  private
  def send_notification
    if self.g_index_was <= MIN_INDEXED_THRESHOLD && self.g_index > MIN_INDEXED_THRESHOLD
      DomainMailer.index_enabled(self.id).deliver_later
    end

    if self.g_index_was > MIN_INDEXED_THRESHOLD && self.g_index <= MIN_INDEXED_THRESHOLD
      DomainMailer.index_disabled(self.id).deliver_later
    end
  end
end
