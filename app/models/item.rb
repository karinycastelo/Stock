class Item < ApplicationRecord
  belongs_to :type
  belongs_to :sector
  delegate :secretary, to: :sector
  belongs_to :user
  belongs_to :enterprise, optional: true

  # validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  # , less_than_or_equal_to: 100 }

  has_many :inoutputs
  
  def category
    if rent
      "ALUGADO"
    elsif !rent && !patrimony.nil?
      "PATRIMONIAL"
    else
      "ESTOQUE"
    end
  end

  def quantity
    soma = 0
    for io in self.inoutputs
      io.name == "Entrada" ? soma = soma + io.quantity : soma = soma - io.quantity
    end
    soma
  end

  def self.search(search)
    if search
      where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
    # joins(:sector, :enterprise).where("sectors.name LIKE ? OR items.name LIKE ? OR items.description LIKE ? OR enterprises.name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def rent_option
    rent ? "SIM" : "NÃO"
  end

  def rent_enterprise
    rent ? self.enterprise.name : "-"
  end
end