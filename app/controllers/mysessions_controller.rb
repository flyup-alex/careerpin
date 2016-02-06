class MysessionsController < Devise::SessionsController

prepend_before_action :delete_providers, only: :destroy

	def delete_providers
		current_user.providers.all.each do |prov|
			prov.destroy
		end
	end
end
