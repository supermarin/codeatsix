class Submit < ActiveRecord::Base

  validates :name,  :presence => true
  validates :surname, :presence => true
  validates :email, :presence => true
  #dodat verifikaciju emaila bolju

end
