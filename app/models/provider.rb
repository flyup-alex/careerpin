class Provider < ActiveRecord::Base

belongs_to :user

	def self.create_or_find(auth, current_user)
		where(provider: auth.provider, uid: auth.uid ).first_or_create do |provider|
			provider.provider = auth.provider
	    	provider.uid = auth.uid
	    	provider.token2 = auth.credentials.secret
	    	provider.token1 = auth.credentials.token
	    	provider.user_id = current_user.id
	    	provider.save
		end
	end

end
