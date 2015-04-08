module PageRankr
  class GoogleCaptchaException < StandardError
  end

  class Request
    def perform
      method = tracker.method
      url = tracker.url

      response = HTTParty.send(method, url, construct_options(tracker))
      raise GoogleCaptchaException.new unless response.code.eql?(200)

      yield response.body if block_given?
    end
  end
end
