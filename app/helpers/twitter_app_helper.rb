module TwitterAppHelper

	def twitter_feed(profile) 
 		@tweet = Twitter::REST::Client.new do |config|
        config.consumer_key        = "LG74yEHe81rppMoq665Fbee8S"
        config.consumer_secret     = "theOlCPDQYydrg8uTwcHPT9yNk4LZxOR8ijGZf3dQ7sam2w80H"
        config.access_token        = "#{current_user.providers.where(provider: "twitter").first.token1}"
        config.access_token_secret = "#{current_user.providers.where(provider: "twitter").first.token2}"
  		end	
 		@tweet.user_timeline( "#{profile}" ).take(10) #limits array to 10 items
 	
 	
 	end

 	def twitter_homeline(profile) 
 		@tweet = Twitter::REST::Client.new do |config|
        config.consumer_key        = "LG74yEHe81rppMoq665Fbee8S"
        config.consumer_secret     = "theOlCPDQYydrg8uTwcHPT9yNk4LZxOR8ijGZf3dQ7sam2w80H"
        config.access_token        = "#{current_user.providers.where(provider: "twitter").first.token1}"
        config.access_token_secret = "#{current_user.providers.where(provider: "twitter").first.token2}"
  		end	
 		@tweet.user_home_timeline( "#{profile}" ).take(10) #limits array to 10 items
 	
 	
 	end

    def twitter_pass
        @tweet = Twitter::REST::Client.new do |config|
        config.consumer_key        = "LG74yEHe81rppMoq665Fbee8S"
        config.consumer_secret     = "theOlCPDQYydrg8uTwcHPT9yNk4LZxOR8ijGZf3dQ7sam2w80H"
        config.access_token        = "#{current_user.providers.where(provider: "twitter").first.token1}"
        config.access_token_secret = "#{current_user.providers.where(provider: "twitter").first.token2}"
        end
    end

    def searching(data)
        @tweet = Twitter::REST::Client.new do |config|
        config.consumer_key        = "LG74yEHe81rppMoq665Fbee8S"
        config.consumer_secret     = "theOlCPDQYydrg8uTwcHPT9yNk4LZxOR8ijGZf3dQ7sam2w80H"
        config.access_token        = "#{current_user.providers.where(provider: "twitter").first.token1}"
        config.access_token_secret = "#{current_user.providers.where(provider: "twitter").first.token2}"
        end
        @tweet.search(data, :count => 30, :result_type => "recent")
        
    end
end


