class SearchController < ApplicationController
	def index
	end

	def product
		@products = Product.search params[:name]
	end

	def product_params
		params.require(:product).permit(:name)
	end
end
