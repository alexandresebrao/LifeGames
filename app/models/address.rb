class Address < ActiveRecord::Base
	has_many :users
	has_many :orders
	belongs_to :province
	validates :number, :street, :province_id, :city, :postalcode, presence:true
	def name
		return "#{self.street} #{self.number}"
	end
end
