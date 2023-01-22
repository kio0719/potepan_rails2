class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user)
  end
  def confirm
    @reservation = Reservation.new(params.permit(:check_in,:check_out,:users_num,:user_id,:room_id))
    if @reservation.invalid?
      render template: "rooms/edit"
    end
    @count_date = (params[:check_out].to_date - params[:check_in].to_date).to_i
    room = Room.find(params[:room_id])
    @total_fee = room.fee.to_i * params[:users_num].to_i * @count_date
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
    @reservation.attributes =  reservation_params
    if @reservation.invalid?
      render "edit"
    end
    @count_date = (@reservation.check_out - @reservation.check_in).to_i
    @total_fee = @reservation.room.fee * @reservation.users_num * @count_date
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
end
