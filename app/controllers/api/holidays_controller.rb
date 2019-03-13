class Api::HolidaysController < ApplicationController

  def index
    render json: Holiday.all
  end

  def create
    user = User.find_by(id: holiday_params[:user_id])
    holiday = user.holidays.new(holiday_params)
    if holiday.save
      render json: holiday, status: :created
    else
      render json: holiday.errors, status: :unprocessable_entity
    end
  end

  private

  def holiday_params
    params.require(:holiday).permit(:start_at, :end_at, :user_id)
  end
end
