class Article < ActiveRecord::Base

belongs_to :user

def self.create_careerpin_fb( data, current_user, provider)
	  data.each do |info|
	  article = Article.new	
	  article.title = "none"
      article.text = info['message']
      article.time = info['updated_time']
      article.photo_url = info['full_picture']
      article.provider = provider
      article.link = "www.facebook.com/#{info['from']['id']}"
      article.author = info['from']['name']
      article.user_id = current_user.id
	  article.save      
	end
end

def self.create_careerpin_twt( data, current_user, provider)
	  data.each do |info|
	  	if info.media.present?
	  url = info.media[0]["media_url"] 
	  	end
	  article = Article.new	
	  article.title = "none"
      article.text = info.text
      article.time = info.created_at
      article.photo_url = url
      article.provider = provider
      article.link = "link-do_twittear"
      article.author = info.user.name
      article.user_id = current_user.id
	  article.save      
	end

end

end
