class CheckIndexJob < ActiveJob::Base
  queue_as :default

  def perform domain
    p domain.url
    #TODO: perfom later
  end
end
