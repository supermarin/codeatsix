class Submission < ActiveRecord::Base

 belongs_to :event
 has_many :persons
 
end
