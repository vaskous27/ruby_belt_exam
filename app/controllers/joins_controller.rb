class JoinsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  # before_action :require_correct_user, only: [:create, :destroy]

  def create
    @join = Join.new(user_id: current_user.id, event_id: params[:event_id])
    if @join.save
      redirect_to "/events"
    else
      redirect_to "/events"
    end
  end

  def destroy
  	Join.find_by(event_id: params[:id]).destroy
  	redirect_to "/events"
  end
end
