class UsersController < ApplicationController
  before_action :set_current_user, only: [:edit, :update_email, :update_password]

  def edit; end

  def update_email
    if @user.update(email_params)
      redirect_to root_path, notice: 'Email изменен'
    else
      flash.now[:alert] = 'Не удалось изменить Email'
      render :edit
    end
  end

  def update_password
    if password_params[:password] == password_params[:password_confirmation]

      if @user.update(password_params)
        # Sign in the user by passing validation in case their password changed
        bypass_sign_in(@user)
        redirect_to root_path, notice: 'Пароль изменен'
      else
        flash.now[:alert] = 'Не удалось изменить пароль'
        render 'edit'
      end
    else
      flash.now[:alert] = 'Не верно повторно введен пароль'
      render 'edit'
    end
  end

  private

  def set_current_user
    @user = current_user
  end

  def email_params
    params.require(:user).permit(:email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation, :email)
  end
end
