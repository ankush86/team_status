class Api::UsersController < ApplicationController

  def index
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: user
  end

  def update
    if user.update(user_params)
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = user
    if @user && @user.destroy
      render json: { message: "Deletion of user #{@user.full_name} is successful" }, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :contact,  :skills)
  end

  def user
    User.find_by(id: params[:id])
  end
end
