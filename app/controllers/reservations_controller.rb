class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
    @room = Room.all
  end
  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      @room = Room.find(@reservation.room_id)
      render "rooms/show"
    else
      total_fee_date_calc
    end
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to :reservations
    else
      render "confirm"
    end
  end
  def edit
    @reservation = Reservation.find(params[:id])
  end
  def edit_confirm
    @reservation = Reservation.find(params[:id])
    @reservation.attributes = reservation_params
    if @reservation.invalid?
      render "edit"
    else
      total_fee_date_calc
    end
  end
  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to :reservations
    else
      render "edit"
    end
  end
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to :reservations
  end

  def reservation_params
    params.require(:reservation).permit(:check_in,:check_out,:users_num,:user_id,:room_id)
  end
  def total_fee_date_calc
    @count_date = (@reservation.check_out - @reservation.check_in).to_i
    @total_fee = @reservation.room.fee * @reservation.users_num * @count_date
  end
end
