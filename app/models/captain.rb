class Captain < ActiveRecord::Base
  has_many :boats


  def self.catamaran_operators
    joins(boats: :classifications).group(:name).where("classifications.name = ?", "Catamaran")
  end

  def self.sailors
    joins(boats: :classifications).group(:name).where("classifications.name = ?", "Sailboat")
  end

  def self.talented_seafarers
    joins(boats: :classifications).where("classifications.name = ?", "Motorboat").group(:name) & self.sailors
  end

  def self.non_sailors
    self.all - self.sailors
  end
end
