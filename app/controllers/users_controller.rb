class UsersController < ApplicationController
  before_action :require_same_user,except: [:new,:create]
  def index
    # if current_user.admin
    @users=User.all.paginate(page: params[:page],per_page:5)
  end
  def show
    @user=User.find(params[:id])
  end
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save

      flash[:success]= "welcome to the Article blog #{@user.username}"
       session[:user_id]=@user.id
      redirect_to articles_path
    else
      render "new"
    end
    # user=User.find_by(email: params[:session][:email])
    # if user&&user.authenticate(params[:session][:password])
    #   session[:user_id]=user.id
    #   redirect_to articles_path
    # else
    #   render 'new'
    # end
  end
  def edit
    @user=User.find(params[:id])
  end
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success]= "You edit the account"
      redirect_to root_path
    end
  end
  def destroy
    @user=User.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to users_path}
    end
  end
  private
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
  def require_same_user
    unless current_user.admin == true
      redirect_to root_path
    end
  end
end
