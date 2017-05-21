class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update_email
    @user = User.find(current_user.id)
    if @user.update(user_params_email)
      redirect_to root_path, notice: 'Email изменен'
    else
      render 'edit'
    end
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params_password)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params_email
    params.require(:user).permit(:email)
  end

  def user_params_password
    params.require(:user).permit(:password, :password_confirmation, :email)
  end
end
