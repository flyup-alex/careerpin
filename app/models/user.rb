class User < ActiveRecord::Base

	has_many :providers
	has_many :ambasadors
	has_many :twitter_friends
	has_many :articles
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
