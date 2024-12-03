class WelcomeController < ApplicationController
  skip_before_action :verified_user

  def home
  end

  def guest_login
    @guest = User.new
    @roles = Role.all
  end

  def create
    if admin_role_selected? && admin_exists?
      flash[:alert] = "An admin already exists."
      redirect_to guest_login_path
    else
      @guest = User.create(guest_params)
      if @guest.valid?
        session[:user_id] = @guest.id
        redirect_to user_path(@guest)
      else
        @roles = Role.all
        render :guest_login
      end
    end
  end

  private

  def guest_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :role_id,
      :email,
      :avatar,
      :password,
      :password_confirmation
    )
  end

  def admin_role_selected?
    guest_params[:role_id].to_i == Role.find_by(name: "admin")&.id
  end

  def admin_exists?
    User.joins(:role).where(roles: { name: "admin" }).exists?
  end
end
