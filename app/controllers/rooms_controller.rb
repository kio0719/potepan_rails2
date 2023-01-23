class RoomsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_q,only: :index
  before_action :set_room,only: [:show,:edit,:update,:destroy]
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
      flash['notice'] = "施設が作成されました。"
      redirect_to own_rooms_path
    else
      flash['warning'] = "施設の作成に失敗しました。"
      render "new"
    end
  end
  def show
    @reservation = Reservation.new
  end
  def edit
  end
  def update
    if @room.update(room_params)
      flash['notice'] = "施設情報が編集されました。"
      redirect_to own_rooms_path
    else
      flash['warning'] = "施設情報の編集に失敗しました。"
      render "edit"
    end
  end
  def destroy
    @room.destroy
    flash['notice'] = "施設情報が削除されました。"
    redirect_to own_rooms_path
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
  def set_q
    @q = Room.ransack(params[:q])
  end
  def room_params
    params.require(:room).permit(:name,:address,:introduction,:fee,:user_id,:image)
  end
end
