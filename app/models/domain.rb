class Domain < ActiveRecord::Base
  validates :url, url: { allow_blank: true }, presence: true, uniqueness: true

  def host
    URI.parse(self.url).host
  end

  def set_rank(results)
    self.update(g_index: results[:google].to_i)
    self.touch(:checked_at)
  end

  def g_indexed?
    self.g_index > 0
  end
end
