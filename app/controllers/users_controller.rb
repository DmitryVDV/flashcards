require 'awesome_print'
require 'pry'
require 'hirb'

class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update_email
    @user = User.find(current_user.id)
    if @user.update(user_params_email)
      redirect_to root_path, notice: 'Email изменен'
    else
      render 'edit', alert: 'Не удалось изменить Email'
    end
  end

  def update_password
    @user = User.find(current_user.id)
      binding.pry
    if user_params_password[:password] == user_params_password[:password_confirmation]

      if @user.update(user_params_password)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to root_path, notice: 'Пароль изменен'
      else
        render 'edit', notice: 'Не удалось изменить пароль'
      end
    else
      render 'edit', alert: 'Не верно повторно введен пароль'
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
