require 'dragonfly'

class Item < ApplicationRecord
  belongs_to :type
  belongs_to :sector
  delegate :secretary, to: :sector
  belongs_to :user
  belongs_to :enterprise, optional: true
  dragonfly_accessor :qr_code

  def category
    if rent
      "ALUGADO"
    elsif !rent && !patrimony.nil?
      "PATRIMONIAL"
    else
      "ESTOQUE"
    end
  end

  def self.search(search)
    where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    # joins(:sector, :enterprise).where("sectors.name LIKE ? OR items.name LIKE ? OR items.description LIKE ? OR enterprises.name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def rent_option
    rent ? "SIM" : "NÃO"
  end

  def rent_enterprise
    rent ? self.enterprise.name : "-"
  end

  def sector_name
    self.sector.name
  end

  def secretary_name
    self.sector.secretary.name
  end

end