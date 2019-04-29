class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications


  def self.my_all
    self.all
  end

  def self.longest
    joins(:boats).group(:name).where("boats.length = ?", Boat.maximum("length")).order(:id)
  end
end
