class Event < ActiveRecord::Base

  has_many :submissions, :autosave => false
  has_many :persons, :through => :submissions, :autosave => false

  validates_presence_of :title
  validates_presence_of :announcement
  validates_uniqueness_of :slug
  
  def date
    if scheduled_at
      return scheduled_at.strftime("%d.%m.%Y.")
    else
      return "n/a"
    end
  end

  def time
    if scheduled_at
      scheduled_at.strftime("%H")
    else
      return "? "
    end
  end

  def self.hackathons
    where("whatisit = 'hackathon'")
  end

  def self.meetups
    where("whatisit = 'meetup'")
  end

  def self.upcomings
    where("scheduled_at >= ? AND is_active = ?", Date.today, true)
        .order('scheduled_at ASC')
  end

  def self.active
    upcomings.first
  end

  def as_json(options = {})
    super :except => [:created_at, :updated_at], 
          :include => :persons
  end  
end
