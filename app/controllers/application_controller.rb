class ApplicationController < ActionController::Base

# Rest of file ommited.  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :check_cart
  helper_method :cart
  helper_method :format_number

  def format_number x
      '%.2f' % x  
  end

  def categories_help
  	@categories ||= Platform.all()
  end
  helper_method :categories_help

  def publishers_help
    @publishers ||= Publisher.all()
  end
  helper_method :publishers_help

  def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def check_cart
    #Create a cart if u don't have one!!! How can u buy a product without getting a cart!!!!!
    
    session[:cart] ||= []
    
  end

  def cart
    @cart = session[:cart]
  end
end
