class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.text :description
      t.string :model
      t.float :rent_cost_per_day

      t.timestamps
    end
  end
end
