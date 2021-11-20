class AddAddressToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :address, :string
  end
end
