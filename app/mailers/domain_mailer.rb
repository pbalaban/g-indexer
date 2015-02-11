class DomainMailer < ApplicationMailer
  def index_enabled(domain_id)
    @domain = Domain.find(domain_id)

    mail(to: Settings.mailer.mail_to, subject: "Domain: #{@domain.url} is now indexed")
  end

  def index_disabled(domain_id)
    @domain = Domain.find(domain_id)

    mail(to: Settings.mailer.mail_to, subject: "Domain: #{@domain.url} is now not-indexed")
  end
end
