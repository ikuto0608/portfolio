class Admin::User::SkillsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :correct_skill, only: :destroy

  def index
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = current_user.skills.build(skill_params)
    if @skill.save
      flash[:success] = "Skill created!"
      redirect_to admin_user_path(current_user)
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
  end

  def destroy
    @skill.destroy
    flash[:sucess] = "Skill destoryed."
    redirect_to admin_user_path(current_user)
  end

  private
    def skill_params
      params.require(:skill).permit(:name, :degree, :type)
    end

    def correct_skill
      @skill = current_user.skills.where(id: params[:id]).limit(1).first
      redirect_to admin_user_path(current_user) if @skill.nil?
    end
end
