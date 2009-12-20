
xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title t('poll.users_polls', :user => @profile.full_name)
    xml.link SITE
    xml.description t('poll.users_polls', :user => @profile.full_name) + " / #{SITE_NAME}"
#     xml.language 'en-us'
    @polls.each do |poll|
      xml.item do
        xml.title poll.question
        #xml.description "poll.body"
        xml.author "#{@profile.full_name}"
        xml.pubDate @profile.created_at
        xml.link profile_poll_url(@profile, poll)
        xml.guid profile_poll_url(@profile, poll)
      end
    end
  end
end
