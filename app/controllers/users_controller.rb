class UsersController < ApplicationController
  before_action :set_user
  def profile
  end
  def profile_edit
  end
  def profile_update
    if @user.update(user_params)
      flash['notice'] = "プロフィールの情報が更新されました。"
      redirect_to users_profile_path
    else
      flash['warning'] = "プロフィールの情報の更新に失敗しました。"
      render "profile_edit"
    end
  end
  def account
  end

  private
  def set_user
    @user = current_user
  end
  def user_params
    params.require(:user).permit(:name,:icon,:introduction)
  end
end
