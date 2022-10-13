class SessionsController < ApplicationController
  def new

  end
  def create

    user=User.find_by(email: params[:session][:email])
    if user&&user.authenticate(params[:session][:password])
      flash[:success] = ""
      session[:user_id]=user.id
      redirect_to articles_path
    else
      flash[:success] = "You password or email is incorrect"
      render 'new'
    end
  end
  def destroy
    session[:user_id]=nil
    redirect_to login_path
  end
end
