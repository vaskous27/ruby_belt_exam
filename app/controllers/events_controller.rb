class EventsController < ApplicationController
  before_action :require_login, only: [:create, :destroy, :edit, :update]
   # before_action :require_correct_user, only: [:create, :destroy, :edit, :update]
  def create
    event = Event.new(event_params)

    if event.save
      redirect_to :back
    else
      flash[:errors] = ["Date can't be in the past"]
      redirect_to :back
    end
  end

  
  def index

    @user = User.find(session[:user_id])

    @events = Event.where(state: "#{@user.state}")
   
    @eventsNot = Event.where.not(state: "#{@user.state}")

  end


  def edit
     @edit_event = Event.find(params[:id])
     @date = @edit_event.date.strftime "%d/%m/%Y"
  end

  def update
     Event.find(params[:id]).update(event_params)
     redirect_to '/events'
  end

  def destroy
     Event.find(params[:id]).destroy
    redirect_to '/events'
  end

  def show
    @show_event = Event.find(params[:id])

    @comment = Comment.where(event_id: @show_event.id)
  end



  private
   def event_params
    params.require(:event).permit(:name, :date, :location, :state, :user_id )
   end

end
