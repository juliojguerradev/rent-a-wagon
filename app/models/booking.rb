class Booking < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_associated :user
  validates_associated :vehicle
end
