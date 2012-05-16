class Person < ActiveRecord::Base
  has_many :submissions
  has_many :events, :through => :submissions
  

  #validates :person_id,  :presence => true
  validates :name,
            :presence => true

  validates :email,
            :presence => true,
            :uniqueness => true
 
end
