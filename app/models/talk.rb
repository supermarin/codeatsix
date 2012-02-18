class Talk < ActiveRecord::Base
  belongs_to :event
  has_many :persons

  validates :title, :presence => true, :length => { :in => 2..100 }
  validates :body, :presence => true, :length => { :in => 2..500 }
end
