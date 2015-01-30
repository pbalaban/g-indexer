class FailedJob < ActiveJob::Base
  queue_as :default

  def perform domain
    raise 'Some error inside resque'
  end
end
