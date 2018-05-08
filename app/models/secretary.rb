class Secretary < ApplicationRecord
    has_many :sectors
    delegate :items, to: :sectors
end
