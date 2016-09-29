class Backlink < ActiveRecord::Base
  include Checkable

  belongs_to :project

  validates :referrer_page, url: { allow_blank: true }, presence: true
  validates :referent_domain, presence: true
  validates :project_id, presence: true

  after_save :send_notification

  scope :expire_in, ->(period) do
    where(expired_at: DateTime.current..(DateTime.current + period))
  end

  def self.check_job_class
    CheckBacklinkJob
  end

  def self.expire_tomorrow
    Backlink.expire_in(1.day).each do |backlink|
      BacklinkMailer.expire_tomorrow(self.id).deliver_later
    end
  end

  def self.expire_next_week
    Backlink.expire_in(1.week).each do |backlink|
      BacklinkMailer.expire_next_week(self.id).deliver_later
    end
  end

  def set_active(value)
    self.update(active: value)
    self.touch(:checked_at)
  end

  def default_expired_at
    self.expired_at || DateTime.current.in_time_zone("Pacific Time (US & Canada)")
  end

  def formatted_expired_at
    return nil unless self.expired_at

    self.expired_at.in_time_zone("Pacific Time (US & Canada)").strftime('%b %d, %I:%M %p %Z')
  end

  private
  def send_notification
    if self.active_changed?
      if self.active?
        BacklinkMailer.link_enabled(self.id).deliver_later
      else
        BacklinkMailer.link_disabled(self.id).deliver_later
      end
    end
  end
end
