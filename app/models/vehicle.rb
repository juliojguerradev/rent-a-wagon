class Vehicle < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :model, :brand, presence: true
  validates :rent_cost_per_day, numericality: true
end
