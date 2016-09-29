class Project < ActiveRecord::Base
  serialize :emails, Array

  has_many :backlins
  has_many :domains

  validates :title, presence: true

  before_save :remove_empty_email

  def self.for_select
    self.order(:title).pluck(:title, :id)
  end

  private
    def remove_empty_email
      self.emails.reject!(&:blank?)
    end
end
