class RoomsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_q,only: :index
  def index
    @results = @q.result
    @count = @results.count
  end
  def own
    @rooms = Room.where(user_id: current_user.id)
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  def edit
    @room = Room.find(params[:id])
  end
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to :rooms
    else
      render "edit"
    end
  end
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to :rooms
  end

  private
  def set_q
    @q = Room.ransack(params[:q])
  end
  def room_params
    params.require(:room).permit(:name,:address,:introduction,:fee,:user_id,:image)
  end
end
