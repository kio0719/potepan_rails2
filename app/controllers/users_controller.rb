class UsersController < ApplicationController
  def index
  end
  def profile
    @user = current_user
  end
  def profile_edit
    @user = current_user
  end
  def profile_update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_profile_path
    else
      render "profile_update"
    end
  end
  def account
    @user = current_user
  end
  def account_edit
    @user = current_user
  end
  def account_update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_account_path
    else
      render "account_edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:icon)
  end
end
