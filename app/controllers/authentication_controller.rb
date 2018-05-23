class AuthenticationController < ApplicationController
  def index
    if not current_user
      redirect_to sign_in_path
    end
  end
  
  def sign_in
  end

  def login
    if current_user
      redirect_to root_path
    end
    username_or_email = (params[:username]).downcase
    password = params[:password]

    if username_or_email.rindex('@')
      email=username_or_email
      user = User.authenticate_by_email(email, password)
    else
      username=username_or_email
      user = User.authenticate_by_username(username, password)
    end

    if user
      session[:user_id] = user.id
      if session[:url]
          url = session[:url]
          session[:url] = ""
          redirect_to url
      else
        redirect_to root_path
      end
    else
      flash.now[:error] = 'Unknown user. Please check your username and password.'
      render :action => "sign_in"
    end
  end
  
  def signed_out
    session[:user_id] = nil
    flash[:notice] = "You have been signed out."
    render :action => "sign_in"
  end

  def create_user
    if current_user
      redirect_to root_path
    end
    @user = User.new
    @address = Address.new
    @provinces = Province.all
  end

  def register
    if current_user
      redirect_to root_path
    end

    @user = User.new(user_params)
    @address = Address.new(address_params)
    @provinces = Province.all
    if @user.valid? && @address.valid?
      @address.save
      # User Level is always Customer id=1
      @user.username = @user.username.downcase
      customer_group = Userlevel.find(1)
      @user.userlevel = customer_group
      @user.address = @address
      @user.save

      session[:user_id] = @user.id
      flash[:notice] = 'Welcome.'
      redirect_to root_path
    else
      render :action => "create_user"
    end
  end
  
  def change_address
      @address = current_user.address
      @provinces = Province.all
  end

  def update_address
     @address = current_user.address
     @address.update(address_params)
     redirect_to userinfo_path 
  end
  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :fname, :lname)
  end
  def address_params
      params.require(:address).permit(:number, :city, :street, :postalcode, :province_id)
  end
end