class EmailAddress < ActiveRecord::Base
  validates :email, email: { strict_mode: true }

  scope :for_google_index, ->{ where(send_google_index_change: true) }
  scope :for_backlinks, ->{ where(send_backlink_change: true) }
end
