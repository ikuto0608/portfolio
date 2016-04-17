class Admin::UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :new]

  def index
    @users = User.all.to_a
  end

  def show
    @user = ::User.eager_load(:experiences, :products, :skills, :sns)
                  .find(params[:id])
  end

  def new
    @user = ::User.new
  end

  def create
    @user = ::User.new(user_params)
    @user.full_name = @user.first_name + "." + @user.last_name
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Portfolio App!"
      redirect_to [:admin, @user]
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to [:admin, @user]
    else
      render 'edit'
    end
  end

  def destroy
    ::User.find(params[:id]).destroy
    flash[:sucess] = "User destoryed."
    redirect_to admin_users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :from, :age)
    end

    def correct_user
      @user = ::User.find(params[:id])
      redirect_to(admin_login_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(admin_user_path(current_user)) unless current_user.admin?
    end
end
