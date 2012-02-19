class HomeController < ApplicationController
  def index
    @event = Event.first
    @person = Person.new
  end

  def apply

    @event = Event.find(params[:event_id])
    @person = Person.new(params[:person])

    @event.persons << @person

    if @event.save
      render :json => Submission.last
    else
      raise "KITA SINE"
    end

  end
end
