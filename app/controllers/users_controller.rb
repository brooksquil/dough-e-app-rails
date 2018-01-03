class UsersController < ApplicationController
  
  def index
  end

  
  def new
    @user = User.new
  end

  def show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :work_phone, :mobile_phone, :is_active, :admin, :company_id)
    end
end
