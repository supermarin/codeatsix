class Event < ActiveRecord::Base
  has_many :submissions
  has_many :persons, :through => :submissions

  validates_presence_of :title
  validates_presence_of :announcement

end
