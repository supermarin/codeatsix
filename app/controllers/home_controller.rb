class HomeController < ApplicationController
  def index
  # @events = Event.all
   @event = Event.where("scheduled_at >= ?", DateTime.now.to_date)
   
  end
  
  def show
      @event = Event.find(params[:id])
   end

  
end
