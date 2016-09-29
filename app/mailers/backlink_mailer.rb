class BacklinkMailer < ApplicationMailer
  def link_enabled(backlink_id)
    @backlink = Backlink.find(backlink_id)

    mail(
      to: @backlink.project.emails,
      subject: "Backlink for #{@backlink.referent_domain} is enabled"
    )
  end

  def link_disabled(backlink_id)
    @backlink = Backlink.find(backlink_id)

    mail(
      to: @backlink.project.emails,
      subject: "Backlink for #{@backlink.referent_domain} is disabled"
    )
  end

  def expire_tomorrow(backlink_id)
    @backlink = Backlink.find(backlink_id)

    mail(
      to: @backlink.project.emails,
      subject: "Backlink for #{@backlink.referent_domain} will expire tomorrow"
    )
  end

  def expire_next_week(backlink_id)
    @backlink = Backlink.find(backlink_id)

    mail(
      to: @backlink.project.emails,
      subject: "Backlink for #{@backlink.referent_domain} will expire next week"
    )
  end
end
