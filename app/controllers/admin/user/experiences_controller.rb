class Admin::User::ExperiencesController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :correct_experience, only: [:update, :destroy]

  def index
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      flash[:success] = "Experience created!"
      redirect_to admin_user_path(current_user)
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    if @experience.update_attributes(experience_params)
      flash[:success] = "Experience updated"
      redirect_to admin_user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @experience.destroy
    flash[:sucess] = "Experience destoryed."
    redirect_to admin_user_path(current_user)
  end

  private
    def experience_params
      params.require(:experience).permit(:name, :year, :language)
    end

    def correct_experience
      @experience = current_user.experiences.where(id: params[:id]).limit(1).first
      redirect_to admin_user_path(current_user) if @experience.nil?
    end
end
