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
end
