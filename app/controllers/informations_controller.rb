class InformationsController < ApplicationController
  def index
    @informations = Information.all.order('created_at DESC')
    @events = Information.all
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def information_params
    params.require(:information).permit(:title, :content, :image, :start_time).merge(user_id: current_user.id)
  end
end
