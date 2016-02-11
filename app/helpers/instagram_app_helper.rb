module InstagramAppHelper


def instagram_pass

	Instagram.configure do |config|

    config.client_id = "2929837f1ff24f8cabccd1a47a07b53b"

    config.access_token = "#{current_user.providers.where(provider: "instagram").first.token1}"

    end
	
end



end
