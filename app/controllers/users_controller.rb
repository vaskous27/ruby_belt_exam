class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update]


  def create
    user = User.new(user_params)

    if user.save
      redirect_to :root
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @edit_user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(user_params)
    redirect_to '/events'
  end

 private
   def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
   end
end
