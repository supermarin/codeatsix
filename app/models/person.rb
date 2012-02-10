class Person < ActiveRecord::Base

  #validates :person_id,  :presence => true
  validates :first_name, :presence => true,:format => { :with => /\A[a-zA-Z]+\z/, :message => "Dozvoljena su samo slova" },:length => { :in => 2..15 }
  validates :last_name, :presence => true,:format => { :with => /\A[a-zA-Z]+\z/, :message => "Dozvoljena su samo slova" },:length => { :in => 2..15 }
  validates :e_mail, :presence => true
 
  #dodat verifikaciju emaila bolju
  # to cemo s dodavanjem novog validatora tj. nove klase za validaciju emaila
 
  belongs_to :submission
  belongs_to :talk
  
end
