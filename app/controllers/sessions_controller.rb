class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      user.has_role? :customer
      respond_with resource, :location => customer_menu_path
    else
      respond_with resource, :location => admin_menu_path
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end

    
