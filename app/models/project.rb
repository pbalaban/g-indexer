class Project < ActiveRecord::Base
  serialize :emails, Array

  validates :title, presence: true

  before_save :remove_empty_email

  private
    def remove_empty_email
      self.emails.reject!(&:blank?)
    end
end
