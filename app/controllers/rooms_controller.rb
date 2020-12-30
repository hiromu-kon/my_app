class RoomsController < ApplicationController


  def index
    @rooms = Room.all
  end

  def new
    @room = current_user.rooms.new
  end

  def create
    @room = current_user.rooms.create(room_params)
    if @room.save
      flash[:success] = "Room was successfully created."
      redirect_to :rooms
    else
      flash.now[:danger] = "Failed to create room."
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = current_user.reservations.new
  end

  def search
  end

  private

    def room_params
      params.require(:room).permit(:name, :content, :cost, :address, :image, :user_id)
    end
end
