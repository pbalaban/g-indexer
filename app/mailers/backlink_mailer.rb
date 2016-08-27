class BacklinkMailer < ApplicationMailer
  def link_enabled(backlink_id)
    @backlink = Backlink.find(backlink_id)

    mail(
      to: EmailAddress.for_backlinks.pluck(:email),
      subject: "Backlink for #{@backlink.referent_domain} is enabled"
    )
  end

  def link_disabled(backlink_id)
    @backlink = Backlink.find(backlink_id)

    mail(
      to: EmailAddress.for_backlinks.pluck(:email),
      subject: "Backlink for #{@backlink.referent_domain} is disabled"
    )
  end
end
