xml = xml_instance unless xml_instance.nil?
xml.item do
  poll = feed_item.item
  xml.title "#{poll.profile.full_name}"+ I18n.t('feed_item.user_created_poll') + " #{time_ago_in_words poll.created_at}" + I18n.t('ago') + "#{poll.question}"
  #xml.description "poll"
  xml.author "#{poll.profile.email} (#{poll.profile.full_name})"
  xml.pubDate poll.updated_at
  xml.link profile_poll_url(poll.profile, poll)
  xml.guid profile_poll_url(poll.profile, poll)
end
