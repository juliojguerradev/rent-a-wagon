require 'faker'

# users
User.new(email: "edu@lewagon.com", first_name: "Eduardo", password: "123456").save
User.new(email: "fer@lewagon.com", first_name: "Fernando", password: "123456").save
User.new(email: "manu@lewagon.com", first_name: "Manuel", password: "123456").save
User.new(email: "julio@lewagon.com", first_name: "Julio", password: "123456").save

# Delete Bookings created from seed
Booking.destroy_all

def new_vehicle(user_id)
  Vehicle.new(
    name: Faker::Vehicle.make_and_model,
    description: "Last model book now",
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    rent_cost_per_day: (10..20).to_a.sample,
    address: Faker::Address.street_address,
    user_id: user_id
  )
end

def new_booking(user_id, vehicle_id)
  Booking.new(
    vehicle_id: vehicle_id,
    user_id: user_id,
    start_date: Date.today + (1..10).to_a.sample,
    end_date: Date.today + (11..29).to_a.sample,
    status: "available"
  )
end

User.all.each do |user|
  2.times do
    car = Vehicle.new(
      name: Faker::Vehicle.make_and_model,
      description: "a good car",
      model: Faker::Vehicle.model,
      brand: Faker::Vehicle.make,
      rent_cost_per_day: (10..20).to_a.sample,
      address: Faker::Address.street_address
    )
    car.user = user
    car.save

    2.times do
      vehicle_to_book = new_vehicle(user.id)
      vehicle_to_book.save
      booking = new_booking(user.id, vehicle_to_book.id)
      booking.save
    end
  end
end
