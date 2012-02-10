class Event < ActiveRecord::Base

validates :title, :presence => true,:length => { :in => 2..100 }
validates :body, :presence => true,:length => { :in => 2..500 }
has_many :submissions
has_many :talks
  
end
