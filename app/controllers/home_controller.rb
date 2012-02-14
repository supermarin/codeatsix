class HomeController < ApplicationController
  def index
  # @events = Event.all
   @event = Event.where("scheduled_at >= ?", DateTime.now.to_date)
   
  end
  
  def show
      @event = Event.find(params[:id])
   end
   def event_details
      @event = Event.find(params[:id])
   end

   def eventi
      @event = Event.all
      
   end
  
   
   def add_talker
     
       @person_for_save = Person.new(params[:person])
       @person = Person.fins(params[:e_mail])
       
        if @person.blank?
             @person_for_save.save
        end 
      
        
  
   end
   
   def add_submission
     
       @person_for_save = Person.new(params[:person])
       @person = Person.fins(params[:e_mail])
       
        if @person.blank?
             @person_for_save.save
        end 
      
   end
end
