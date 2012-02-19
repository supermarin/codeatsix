class Person < ActiveRecord::Base
  has_many :submissions
  has_many :events, :through => :submissions
  

  #validates :person_id,  :presence => true
  validates :first_name,
            :presence => true,
            :format => { :with => /\A[a-zA-Z]+\z/, :message => "Dozvoljena su samo slova" },
            :length => { :in => 2..15 }

  validates :last_name,
            :presence => true,
            :format => { :with => /\A[a-zA-Z]+\z/, :message => "Dozvoljena su samo slova" },
            :length => { :in => 2..15 }

  validates :email,
            :presence => true
 
  #dodat verifikaciju emaila bolju
  # to cemo s dodavanjem novog validatora tj. nove klase za validaciju emaila
end
