class Domain < ActiveRecord::Base
  MIN_INDEXED_THRESHOLD = 0

  after_save :send_notification

  validates :url, url: { allow_blank: true }, presence: true, uniqueness: true

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
    became_active = self.g_index_was <= MIN_INDEXED_THRESHOLD && self.g_index > MIN_INDEXED_THRESHOLD

    DomainMailer.index_changed(self.id).deliver_later if became_active
  end
end
