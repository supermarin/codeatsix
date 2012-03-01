class HomeController < ApplicationController
  def index
    @event = Event.active
  end

  def apply
    event = Event.find(params[:event_id])

    person = Person.find_by_email(params[:person][:email])
    person = Person.new(params[:person]) unless person.present?
    
    # if person.new_record?
    #   raise person.inspect
    # end

    begin
      event.persons << person
      render :json => { :message => "Prijava zaprimljena, woohoo!" }
    rescue Exception => e
      render :json => e.message 
    end
  end
end
