class Domain < ActiveRecord::Base
  MIN_INDEXED_THRESHOLD = 0

  include Checkable

  belongs_to :project

  validates :url, url: { allow_blank: true }, presence: true, uniqueness: true
  validates :project_id, presence: true

  after_save :send_notification

  def self.check_job_class
    CheckHostJob
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
