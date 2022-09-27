class Earthling < ActiveRecord::Base
  has_many :visitations
  has_many :aliens, through: :visitations

  def visitations
    Visitation.where(earthling_id: self.id)  
  end

  def aliens
    self.visitations.map do |v| 
      Alien.where(id: v.alien_id) 
    end 
  end 

  def full_name
    self.first_name + ' ' + self.last_name
  end 

  def self.filter_by_job(job)
    Earthling.where("job LIKE ?","%#{job}%")  
  end

end
