class Event < ActiveRecord::Base
  has_many :submissions
  has_many :talks

  validates :title, :presence => true,:length => { :in => 2..100 }
  validates :body, :presence => true,:length => { :in => 2..500 }
end
