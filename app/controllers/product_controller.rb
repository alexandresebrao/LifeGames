class ProductController < ApplicationController
	def index
		@product = Product.find(params[:id])
	end

	def category
		@category = Platform.find(params[:id])
		if not params[:page]
			@page = 1
		else
			@page = params[:page]
		end
		@products = Product.where(platform_id: params[:id]).order(created_at: :desc).page(@page).per(15)
	end

	def publisher
		@publisher = Publisher.find(params[:id])
		@products = Product.where(publisher_id: params[:id]).order(created_at: :desc)
	end
end
