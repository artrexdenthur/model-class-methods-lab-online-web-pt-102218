class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications


  def self.first_five
    return self.all.take(5)
  end

  def self.dinghy
    return self.all.select{ |b| b.length < 20 }
  end

  def self.ship
    return self.all.select{ |b| b.length >= 20 }
  end    

  def self.last_three_alphabetically
    return self.all.sort_by{ |b| b.name }.reverse.take(3)
  end

  def self.without_a_captain
    return self.all.select{ |b| !b.captain }
  end

  def self.sailboats
    return self.all.select{ |b| b.classifications.pluck(:name).include? 'Sailboat' }
  end

  def self.with_three_classifications
    return self.all.select{ |b| b.classifications.count == 3 }
  end

  def classification_names
    self.classifications.pluck(:name)
  end

end
