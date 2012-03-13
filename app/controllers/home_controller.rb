class HomeController < ApplicationController
  def index
    @event = Event.active
    render 'index'
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
