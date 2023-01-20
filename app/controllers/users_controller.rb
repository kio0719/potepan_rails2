class UsersController < ApplicationController
  def index
  end
  def profile
    @user = current_user
  end
  def account
    @user = current_user
  end
end
