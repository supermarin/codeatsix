class Submission < ActiveRecord::Base
 belongs_to :events
 belongs_to :person
end
