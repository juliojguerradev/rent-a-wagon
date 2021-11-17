require 'faker'

# users
User.new(email: "edu@lewagon.com", password: "123456").save
User.new(email: "fer@lewagon.com", password: "123456").save
User.new(email: "julio@lewagon.com", password: "123456").save
User.new(email: "julio@lewagon.com", password: "123456").save

User.all.each do |user|
  2.times do
    car = Vehicle.new(name: Faker::Vehicle.make_and_model, description: "a good car", model: Faker::Vehicle.model, brand: Faker::Vehicle.make, rent_cost_per_day: (10..20).to_a.sample)
    car.user = user
    car.save
  end
end
