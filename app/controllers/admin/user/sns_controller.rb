class Admin::User::SnsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :correct_sns, only: [:update, :destroy]

  def index
  end

  def new
    @sns = Sns.new
  end

  def create
    @sns = current_user.sns.build(sns_params)
    if @sns.save
      flash[:success] = "SNS created!"
      redirect_to admin_user_path(current_user)
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @sns = Sns.find(params[:id])
  end

  def update
    if @sns.update_attributes(sns_params)
      flash[:success] = "SNS updated"
      redirect_to admin_user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @sns.destroy
    flash[:sucess] = "SNS destoryed."
    redirect_to admin_user_path(current_user)
  end

  private
    def sns_params
      params.require(:sns).permit(:kind, :url)
    end

    def correct_sns
      @sns = current_user.sns.where(id: params[:id]).limit(1).first
      redirect_to admin_user_path(current_user) if @sns.nil?
    end
end
