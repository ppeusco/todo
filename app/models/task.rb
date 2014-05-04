class Task < ActiveRecord::Base
  validates_presence_of :title 
  validate :future_completed_date 

  private 

  def future_completed_date 
  	if !completed.blank? && completed > Date.today 
  	  self.errors.add(:completed, "can't be in the future") 
  	end 
  end 
end
