class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    take(5)
  end

  def self.dinghy
    where("length < ?", 20)
  end

  def self.ship
    where("length >= ?", 20)
  end

  def self.last_three_alphabetically
    order(:name).reverse_order.take(3)
  end

  def self.without_a_captain
    where(captain_id: nil)
  end

  def self.sailboats
    includes(:classifications).where('classifications.name = ?', "Sailboat").references(:classifications)
  end

  def self.with_three_classifications
    Boat.joins(:classifications).group(:name).having("count(boats.name) >= ?", 3)
  end


end
