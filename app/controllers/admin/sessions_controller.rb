class Admin::SessionsController < ApplicationController

  def new
  end

  def create
    user = ::User.where(email: params[:session][:email].downcase).limit(1).first
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_back_or(user)
    else
      flash.now[:error] = 'Invalid email/password cobination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to admin_login_path
  end
end
