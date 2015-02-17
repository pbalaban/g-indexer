class DomainMailer < ApplicationMailer
  def index_enabled(domain_id)
    @domain = Domain.find(domain_id)

    mail(to: EmailAddress.pluck(:email), subject: "Domain: #{@domain.url} is now indexed")
  end

  def index_disabled(domain_id)
    @domain = Domain.find(domain_id)

    mail(to: EmailAddress.pluck(:email), subject: "Domain: #{@domain.url} is now not-indexed")
  end
end
