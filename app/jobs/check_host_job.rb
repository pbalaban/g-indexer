class CheckHostJob < ActiveJob::Base
  queue_as :default

  def perform(domain)
    domain.set_rank(PageRankr.indexes(domain.host, :google))
  end
end
