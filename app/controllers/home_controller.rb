class HomeController < ApplicationController
  def index
    @event = Event.first
    @person = Person.new
  end
end
