class Sector < ApplicationRecord
  belongs_to :secretary
  has_many :items
end
