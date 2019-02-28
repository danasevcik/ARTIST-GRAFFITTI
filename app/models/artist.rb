class Artist < ApplicationRecord
  has_many :graffittis

  validates :name, presence: true
  validates :hometown, presence: true
end
