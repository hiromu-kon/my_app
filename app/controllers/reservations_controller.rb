class ReservationsController < ApplicationController
  before_action :authenticate_user, only: [:create, :lend, :index]

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      flash[:success] = "Reservation was successfully created."
      redirect_to @reservation
    else
      redirect_to :reservations
      flash[:danger] = "Failed to create room reservation."
    end
  end

  def index
    @reservations = current_user.reservations.all
  end

  def lend
    @rooms = current_user.rooms
  end


  def show
    @reservation = Reservation.find(params[:id])
  end

  private

    def reservation_params
      params.require(:reservation).permit(:start_date, :finish_date, :room_id, :people_num)
    end
end
