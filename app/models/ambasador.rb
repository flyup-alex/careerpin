class Ambasador < ActiveRecord::Base

belongs_to :user

validates :object_id, presence: true, uniqueness: true 

end
