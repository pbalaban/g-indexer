class Backlink < ActiveRecord::Base
  include Checkable

  belongs_to :project

  validates :referrer_page, url: { allow_blank: true }, presence: true
  validates :referent_domain, presence: true
  validates :project_id, presence: true

  after_save :send_notification

  def self.check_job_class
    CheckBacklinkJob
  end

  def set_active(value)
    self.update(active: value)
    self.touch(:checked_at)
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
