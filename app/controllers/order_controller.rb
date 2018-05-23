class OrderController < ApplicationController
	before_action :verifyuser
	def index
		if cart.count == 0
			redirect_to root_path
		end
		@products = Product.all	
		@provinces = Province.all
		@carts = Product.where(id: cart)
		@total = 0
		@carts.each do |cart|
			@total += cart.end_value
		end
		@tax = current_user.address.province.tax
		@tax_value = (@total/@tax).round(2)
		@totalprice = @tax_value + @total
		@address = current_user.address
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		if not @order.valid?
			redirect_to order_path, :flash => { :now => @order.errors.full_messages.join('<br> ') }
		else 
			if params['newaddress'] == "true"
			   @address = Address.new(address_params)
			   @address.save 
			else
				@address = current_user.address
			end
			# Get products from the cart
			@order.price = 0
			@order.status = "Processing"
			@carts = Product.where(id: cart)
			@carts.each do |cart|
				@order.price += cart.end_value
				@order.products << cart
				cart.stock_quantity -= 1
				cart.save
			end
			@tax = @address.province.tax
			@order.taxprice = (@order.price/@tax).round(2)
			@order.totalprice = @order.taxprice + @order.price
			@order.address = @address
			@order.user = current_user
		    @order.save
			session[:cart] = []
		end
	end

	def show
		@order = Order.find(params[:id])
		if not @order.user == current_user
			redirect_to root_path
		end
	end

	private
    def verifyuser
    	if not current_user
    
			redirect_to sign_in_path , :flash => { :now => 'You need to be logged in to Continue' }
			session[:url] = request.env['PATH_INFO']
		end
	end

    def order_params
      params.require(:order).permit(:creditcard, :creditcarddate, :creditcardname, :creditcardcode)
    end
	def address_params
		params.require(:address).permit(:number, :city, :street, :postalcode, :province_id)
	end

end
