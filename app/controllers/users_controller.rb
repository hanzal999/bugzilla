class UsersController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]

  def new
    if current_user.role_name != "Admin"
      redirect_to user_path(current_user)
    else
      @user = User.new
      @roles = Role.all
    end
  end

  def create
    if admin_role_selected? && admin_exists?
      flash[:alert] = "An admin user already exists. Only one admin is allowed."
      redirect_to new_user_path
      return
    end

    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.first_name} #{@user.last_name} has been successfully created as a #{Role.find(@user.role_id).name}."
      redirect_to new_user_path
    else
      @roles = Role.all
      render :new
    end
  end

  def index
    if current_user.role_name != "Admin"
      redirect_to user_path(current_user)
    else
      @users = User.all
    end
  end

  def show
    if current_user.role_name != "Admin" && current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    else
      @user = User.find(params[:id])
    end
  end

  def edit
    if current_user.role_name != "Admin"
      redirect_to user_path(current_user)
    else
      @user = User.find(params[:id])
      @roles = Role.all
    end
  end

  def update
    @user = User.find(params[:id])
    if admin_update_restriction?
      flash[:alert] = "Admin role cannot be reassigned or removed."
      redirect_to edit_user_path(@user)
      return
    end

    if @user.update(user_params)
      flash[:notice] = "#{@user.first_name} #{@user.last_name} has been successfully updated."
      redirect_to new_user_path
    else
      @roles = Role.all
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_id, :email, :password, :password_confirmation)
  end

  def admin_role_selected?
    user_params[:role_id].to_i == Role.find_by(name: "Admin")&.id
  end

  def admin_exists?
    User.joins(:role).exists?(roles: { name: "Admin" })
  end

  def admin_update_restriction?
    @user.role.name == "Admin" && user_params[:role_id].to_i != @user.role_id
  end
end
