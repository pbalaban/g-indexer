class EmailAddress < ActiveRecord::Base
  validates :email, email: { strict_mode: true }
end
