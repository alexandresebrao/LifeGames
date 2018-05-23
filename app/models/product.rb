
class Product < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'	
	paginates_per 16
	belongs_to :publisher
	belongs_to :platform
	belongs_to :coverbox
	has_and_belongs_to_many :orders

	mount_uploader :coverbox, CoverboxUploader
	
	def self.search(search)
	  search_condition = "%" + search + "%"
	  where('name like ?', search_condition)
	end

	def final_valor
		val = (self.price - ((self.discount_percentage*self.price)/100)).round(2)
		sprintf("%.2f", val)
	end

	def end_value
		(self.price - ((self.discount_percentage*self.price)/100)).round(2)
	end
	def price_without_discount
		sprintf("%.2f", self.price)
	end
end
