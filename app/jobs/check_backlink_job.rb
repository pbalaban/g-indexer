class CheckBacklinkJob < ActiveJob::Base
  queue_as :default

  def perform(backlink)
    page_body = HTTParty.get(backlink.referrer_page).body
    doc = Nokogiri::HTML(page_body)
    link_exists = doc.css('a').any? do |link|
      link.attr(:href) =~ /#{backlink.referent_domain}/
    end

    backlink.set_active(link_exists)
  end
end
