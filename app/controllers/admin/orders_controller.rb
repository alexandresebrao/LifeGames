class Admin::OrdersController < ApplicationController

  before_action :verify_admin

  # GET /users
  # GET /users.json
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def filter
    @orders = Order.where(status: params[:status])
    @filter = params[:status]
  end

  def modify
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_admin_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def order_params
      params.require(:order).permit(:status,:trackinfo)
    end
    
    def verify_admin
      group_admin = Userlevel.find_by(level: "Admin")
      if current_user == nil or current_user.userlevel != group_admin
        redirect_to root_path
      end
    end
end
