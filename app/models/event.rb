class Event < ActiveRecord::Base

  has_many :submissions, :autosave => false
  has_many :persons, :through => :submissions, :autosave => false

  validates_presence_of :title
  validates_presence_of :announcement
  validates_uniqueness_of :slug
  
  def date
    scheduled_at.strftime("%d.%m.%Y.")
  end

  def time
    scheduled_at.strftime("%H")
  end

  def self.active
    where(:is_active => true).order('scheduled_at ASC').last
  end

  def as_json(options = {})
    super :except => [:created_at, :updated_at], :include => :persons
  end  
end
