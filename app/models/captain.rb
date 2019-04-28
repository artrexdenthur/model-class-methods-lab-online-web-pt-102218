class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    return self.select{ |c| c.boats.any?{ |b| b.classifications.any?{ |c| c.name == "Catamaran" }}}
  end

  def self.sailors
    return self.select{ |c| c.boats.any?{ |b| b.classifications.any?{ |c| c.name == "Sailboat" }}}
  end

  def self.talented_seafarers
    return self.select{ |c| c.boats.classification_names.include?("Motorboat") && c.boats.classification_names.include?("Sailboat") }
  end
end
