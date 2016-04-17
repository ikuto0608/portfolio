class Admin::User::ProductsController < ApplicationController
  before_action :signed_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :correct_product, only: :destroy

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = "Product created!"
      redirect_to admin_user_path(current_user)
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end

  def destroy
    @product.destroy
    flash[:sucess] = "Product destoryed."
    redirect_to admin_user_path(current_user)
  end

  private
    def product_params
      params.require(:product).permit(:name, :about, :based_on, :url, :degree)
    end

    def correct_product
      @product = current_user.products.where(id: params[:id]).limit(1).first
      redirect_to admin_user_path(current_user) if @product.nil?
    end
end
