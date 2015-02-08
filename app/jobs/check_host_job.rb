class CheckHostJob < ActiveJob::Base
  queue_as :default

  def perform(domain)
    p domain.url
  end
end
