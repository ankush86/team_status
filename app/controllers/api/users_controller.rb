class Api::UsersController < ApplicationController

  def index
    users = FilterService.call(params)

    render json: result(users)
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

  # Assign project
  def assign_project
    user = User.find_by(id: params[:user_id])
    project = Project.find_by(id: params[:project_id])

    user.assigned_projects.new(project_id: project.id, start_at: Time.now, end_at: params[:end_date])
    if can_assign? && user.save
      render json: user, status: :created
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

  def can_assign?
    UserProjectEngageService.new.check(params) == 'success'
  end

  def result(users)
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    has_previous = page > 1 ? true : false
    has_next = users.count > User::PER_PAGE*page ? true : false

    users = paginate users, per_page: User::PER_PAGE
    {users: users, has_previous: has_previous, has_next: has_next, page: page}
  end
end
