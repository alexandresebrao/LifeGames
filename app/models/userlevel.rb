class Userlevel < ActiveRecord::Base
 has_many :users
	def name
	    return self.level
	end
end
