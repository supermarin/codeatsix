class PagesController < ApplicationController

  def home
    redirect_to '/meetup'
  end

  def meetup
    get_events_data
    render 'meetup'
  end

  def hackathon
    get_events_data
    render 'hackathon'
  end

  def location
    get_events_data
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


  private

  def get_events_data
    @meetup = Event.meetups.active
    @hackathon = Event.hackathons.active

    if not @meetup.present?
      @meetup = Event.new
    end
    
    if not @hackathon.present?
      @hackathon = Event.new
    end
    
  end
end
