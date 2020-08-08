class AddMileageToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :mileage, :integer
  end
end
