xml = xml_instance unless xml_instance.nil?
xml.item do
  f = feed_item.item
  xml.title I18n.t('feed_item.user_updated_profile', :user => f.full_name
  xml.description I18n.t('feed_item.user_updated_profile', :user => f.full_name
  xml.author "#{f.email} (#{f.full_name})"
  xml.pubDate feed_item.created_at
  xml.guid profile_url(f)
end
