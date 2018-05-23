class HomeController < ApplicationController
	def index
		@latests = Product.order(created_at: :desc).limit(5)
		@discounts = Product.where('discount_percentage > ? ', 0).order(discount_percentage: :desc).limit(5)
	end
end
