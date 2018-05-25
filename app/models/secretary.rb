class Secretary < ApplicationRecord
    belongs_to :user

    has_many :sectors
    delegate :items, to: :sectors
end