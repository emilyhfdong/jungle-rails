class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!
    if @user.save
      flash[:notice] = "Account created successfully"
      session[:user_id] = @user.id.to_s
      redirect_to root_path
    else
      flash.now.alert = "Oops, could not create account."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
