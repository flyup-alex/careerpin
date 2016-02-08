module FacebookAppHelper

def facebook_data(user)
	Koala.config.api_version = "v2.1"
	@graph = Koala::Facebook::API.new( user.providers.where(provider: 'facebook').first.token1)

	
end

def get_wall(user, id )
	Koala.config.api_version = "v2.1"
	@hash = Koala::Facebook::API.new( user.providers.where(provider: 'facebook').first.token1).get_connection( id , 'posts',
                    {
                      fields: ['message', 'id', 'from', 'type',
                                'picture','full_picture', 'object_id', 'link', 'created_time', 'updated_time', 'place', 

                        ]})
	
end

end
