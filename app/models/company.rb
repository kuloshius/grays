class Company < ActiveRecord::Base
  def initialize
    @name = "Grays Ltd."
    @id = 1
  end
  
  def name
    @name
  end
  
  def id
    @id
  end
end
