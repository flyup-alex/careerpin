Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '178864905802302', '5fcfd73fd3151e9087155531217b80e4', 
  :display => 'popup', scope: "email", info_fields: 'email'

  provider :instagram, '2929837f1ff24f8cabccd1a47a07b53b',
  					   '5d969832af5c4f66aea5b2d919970a7b', scope: 'public_content follower_list comments relationships likes'

  provider :twitter, 'LG74yEHe81rppMoq665Fbee8S', 'theOlCPDQYydrg8uTwcHPT9yNk4LZxOR8ijGZf3dQ7sam2w80H',
					    {
					      :secure_image_url => 'true',
					      :image_size => 'original',
					      :authorize_params => {
					        :force_login => 'true',
					        :lang => 'pt'
					      }
					    }

end