class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @q = Room.ransack(params[:q])
  end
end
