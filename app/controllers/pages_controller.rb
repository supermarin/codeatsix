class PagesController < ApplicationController

  def home
    redirect_to '/meetup'
  end

  def meetup
    @event = Event.active
    @meetup = Event.meetups.active
    render 'meetup'
  end

  def hackathon
    @event = Event.active
    @hackathon = Event.hackathons.active
    render 'hackathon'
  end

  def location
    @event = Event.active
    render 'location'
  end

  def apply
    event = Event.find(params[:event_id])

    person = Person.find_by_email(params[:person][:email])
    person = Person.new(params[:person]) unless person.present?
    
    begin
      event.persons << person
      render :json => { :message => "Thanks for applying." }
    rescue Exception => e
      render :json => e.message, :status => 500
    end
  end
end
