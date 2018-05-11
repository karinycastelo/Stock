class Input < ApplicationRecord
  belongs_to :item
  def name
    "Entrada"
  end
end
