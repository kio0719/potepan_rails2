class ReservationsController < ApplicationController
  before_action :set_reservation,only: [:edit,:edit_confirm,:update,:destroy]
  def index
    @reservations = Reservation.where(user_id: current_user.id)
    @room = Room.all
  end
  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      @room = Room.find(@reservation.room_id)
      flash['warning'] = "予約情報が不足しています。"
      render "rooms/show"
    else
      total_fee_date_calc
    end
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash['notice'] = "施設の予約を完了しました。"
      redirect_to :reservations
    else
      @room = Room.find(@reservation.room_id)
      flash['warning'] = "予約情報が不足しています。"
      render "rooms/show"
    end
  end
  def edit
  end
  def edit_confirm
    @reservation.attributes = reservation_params
    if @reservation.invalid?
      flash['warning'] = "予約情報が不足しています。"
      render "edit"
    else
      total_fee_date_calc
    end
  end
  def update
    if @reservation.update(reservation_params)
      flash['notice'] = "施設の予約を変更しました。"
      redirect_to :reservations
    else
      flash['warning'] = "予約情報が不足しています。"
      render "edit"
    end
  end
  def destroy
    @reservation.destroy
    flash['notice'] = "施設の予約を削除しました。"
    redirect_to :reservations
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def reservation_params
    params.require(:reservation).permit(:check_in,:check_out,:users_num,:user_id,:room_id)
  end
  def total_fee_date_calc
    @count_date = (@reservation.check_out - @reservation.check_in).to_i
    @total_fee = @reservation.room.fee * @reservation.users_num * @count_date
  end
end
