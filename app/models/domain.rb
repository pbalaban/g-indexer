class Domain < ActiveRecord::Base
  validates :url, url: { allow_blank: true }, presence: true, uniqueness: true

  def host
    URI.parse(self.url).host
  end
end
