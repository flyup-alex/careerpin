module FacebookAppHelper

def facebook_data(user)
	@graph = Koala::Facebook::API.new( user.providers.where(provider: 'facebook').first.token1)

	
end

def get_wall(user, id )
	@hash = Koala::Facebook::API.new( user.providers.where(provider: 'facebook').first.token1).get_connection( id , 'posts',
                    {
                      fields: ['message', 'id', 'from', 'type',
                                'picture','full_picture', 'object_id', 'link', 'created_time', 'updated_time', 'place', 

                        ]})
	
end
end
