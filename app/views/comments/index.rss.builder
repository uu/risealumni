#locals
comments ||= @comments
parent ||= @parent
profile ||= @profile



xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0"){
  xml.channel do
    xml.title t('comment.wall_to_wall_with', :user => profile.full_name
    xml.link SITE
    xml.description t('comment.wall_to_wall_with', :user => profile.full_name " / #{SITE_NAME}"
#    xml.language 'en-us'
    comments.each do |c|
      xml.item do
        xml.title commentable_text(c, false)
        xml.link profile_feed_item_url(profile, c)
        xml.guid profile_feed_item_url(profile, c)
        xml.description sanitize(textilize(c.comment))
        xml.author "#{c.profile.email} (#{c.profile.full_name})"
        xml.pubDate c.updated_at
      end
    end
  end
}
