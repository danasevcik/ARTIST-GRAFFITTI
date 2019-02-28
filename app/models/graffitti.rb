class Graffitti < ApplicationRecord
  belongs_to :artist

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
end
