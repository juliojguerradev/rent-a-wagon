class Vehicle < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :model, :brand, presence: true
  validates :rent_cost_per_day, numericality: true

  pg_search_scope :search_by_name_model_and_brand,
    against: [ :name, :model, :brand ],
    using: {
      tsearch: { prefix: true }
    }
end
