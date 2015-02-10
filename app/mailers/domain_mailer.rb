class DomainMailer < ApplicationMailer
  def index_changed(domain_id)
    @domain = Domain.find(domain_id)

    mail(to: Settings.mailer.mail_to, subject: "Index changed for domain: #{@domain.url}")
  end
end
