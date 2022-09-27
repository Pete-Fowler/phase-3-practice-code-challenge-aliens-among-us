require 'date' 

class Alien < ActiveRecord::Base
  has_many :visitations 
  has_many :earthlings, through: :visitations

  def visitations 
    Visitation.where(alien_id: self.id) 
  end 

  def earthlings
    self.visitations.map do |v| 
      Earthling.where(id: v.earthling_id)
    end
  end

  def visit(earthling)
    d = Date.today 
    Visitation.create(date: d, alien_id: self.id, earthling_id: earthling.id)
  end

  def total_light_years_traveled
    self.light_years_to_home_planet * self.visitations.count * 2
  end

  def self.most_frequent_visitor
    a = Visitation.maximum(:alien_id)
    Alien.where(id: a) 
  end
end
