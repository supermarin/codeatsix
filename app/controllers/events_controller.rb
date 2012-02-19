class EventsController < ApplicationController

  def index
    @event = Event.find(:all)
  end

  def show
    if params[:slug]
      @event = Event.find_by_slug(params[:slug])
    else 
      @event = Event.find(params[:id])
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      render new_event_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_path
    else
      render edit_event_path(@event)
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

end
