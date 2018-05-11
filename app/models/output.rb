class Output < ApplicationRecord
  belongs_to :item
  def name
    "Saída"
  end
end
