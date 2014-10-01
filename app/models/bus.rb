class Bus < ActiveRecord::Base
  has_many :rides
  has_many :reviews, through: :rides, dependent: :destroy

  validates :number,    presence: true
  validates :inbound,   presence: true
  validates :outbound,  presence: true

  def self.search(query)
    where(
      "number ilike ? OR inbound ilike ? OR outbound ilike ?",
      "%#{query}%", "%#{query}%", "%#{query}%"
      )
  end

  def order_number
    if number[0].match(/\d/)
      if number.scan(/\d/).size == 1
        "00" + number
      elsif number.scan(/\d/).size == 2
        "0" + number
      else
        number
      end
    else
      number
    end
  end
end
