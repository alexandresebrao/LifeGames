class CartController < ApplicationController
	def show
		@products = Product.all	
		@carts = Product.where(id: cart)
		@total = 0
		@carts.each do |cart|
			@total += cart.end_value
		end
	end

	def add
		session[:cart] << params[:id]
		redirect_to '/cart'		
	end

	def remove
		session[:cart].delete(params[:id])
		redirect_to '/cart'
	end

	def clean
		session[:cart] = []
		redirect_to '/cart'	
	end
end
