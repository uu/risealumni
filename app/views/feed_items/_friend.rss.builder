xml = xml_instance unless xml_instance.nil?
xml.item do
  f = feed_item.item
  xml.title I18n.t('feed_item.user_invited', :inviter => f.inviter.full_name, :description => f.description(f.inviter), :invited => f.invited.full_name
#   xml.description "#{f.inviter.full_name}'s network in #{SITE_NAME} has been updated."
  xml.author "#{f.invited.email} (#{f.invited.full_name})"
  xml.pubDate feed_item.created_at
  xml.link profile_url( (@profile==f.invited ? f.inviter : f.invited ) )
  xml.guid profile_url( (@profile==f.invited ? f.inviter : f.invited ) )
end
